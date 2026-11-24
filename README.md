# XMALL — Secure E-Commerce Website

A complete e-commerce web application built with **Symfony 7 / PHP 8**, designed
with a **secure-coding focus**: CSRF protection on every form, SQL-injection
prevention through parameterized Doctrine queries, hashed passwords and
role-based access control.

> Academic project — the security hardening angle is the core of the work.

## Features

- **Product catalog** with category filtering and keyword search
- **Shopping cart** (session-based) with quantities and totals
- **Order workflow** — address selection, carrier choice, order recap and persistence
- **Stripe payment integration** (checkout session + success/fail handling)
- **Customer accounts** — registration, login, address book, order history, password change
- **Back office** built with EasyAdmin 4 (products, categories, carriers, headers, orders, users) restricted to `ROLE_ADMIN`
- **Contact form** with e-mail delivery (Mailjet API)
- **Responsive storefront** (Bootstrap)

## Tech stack

| Layer        | Technology                                             |
|--------------|--------------------------------------------------------|
| Framework    | Symfony 7.4 (PHP 8.2)                                  |
| ORM / DB     | Doctrine ORM 3.6, Doctrine Migrations (MySQL/PostgreSQL)|
| Templating   | Twig 3 (automatic output escaping)                     |
| Admin        | EasyAdmin 4                                            |
| Payments     | stripe/stripe-php                                      |
| E-mail       | Mailjet API                                            |
| Quality      | PHPUnit, PHPStan, Rector                               |
| Deployment   | Docker / Docker Compose (dev database)                 |

## Security highlights

This project's main focus is **applied secure coding**. What is implemented,
file by file:

### CSRF protection (Cross-Site Request Forgery)

- Every state-changing form goes through the **Symfony Form component**, which
  embeds and validates a **unique CSRF token per form/session**
  (`config/packages/framework.yaml`).
- The login form is protected by a dedicated token validated by the new
  authenticator system: `CsrfTokenBadge` in
  [`src/Security/LoginAuthenticator.php`](src/Security/LoginAuthenticator.php).
- The search form explicitly disables CSRF (`'csrf_protection' => false` in
  `SearchType`) — intentional and safe: it uses the **GET** method and is
  idempotent/read-only, a documented Symfony best practice.

### SQL injection prevention

- **No raw, concatenated SQL anywhere.** All database access goes through
  Doctrine ORM (QueryBuilder / DQL) with **bound parameters** (`setParameter`),
  which makes injection structurally impossible:
  - product search with `LIKE` → [`ProductRepository::findWithSearch()`](src/Repository/ProductRepository.php)
  - per-user paid orders → [`OrderRepository::findPaidOrdersByUser()`](src/Repository/OrderRepository.php)
- Doctrine migrations keep the schema consistent and auditable.

### Password security

- Passwords are **never stored in plain text**: `password_hashers: auto`
  (bcrypt/argon2) in `config/packages/security.yaml`.
- At registration, [`RegisterController`](src/Controller/RegisterController.php)
  hashes the password with `UserPasswordHasherInterface` **before** persisting.
- `UserRepository` implements `PasswordUpgraderInterface` so hashes are
  re-hashed automatically when a stronger algorithm appears.
- Change-password form requires the **current password** and validates
  `RepeatedType` confirmation (`ChangePasswordType`).

### Access control

`config/packages/security.yaml`:

```yaml
access_control:
  - { path: ^/compte,   roles: IS_AUTHENTICATED_FULLY }  # account area
  - { path: ^/commande, roles: IS_AUTHENTICATED_FULLY }  # checkout
  - { path: ^/admin,    roles: ROLE_ADMIN }              # back office
```

- Route-level enforcement: order creation and account pages are unreachable
  for anonymous users; the admin dashboard only for `ROLE_ADMIN`.
- A custom authenticator (`LoginAuthenticator`) with target-path redirect after
  login and proper logout handling.

### XSS and input validation

- **Twig automatic escaping** on every template output.
- Server-side **validation constraints** on all forms:
  `NotBlank`, `Length`, `Email` (`RegisterType`, `ChangePasswordType`, ...).
- Address, order and carrier inputs are bound to typed entity forms, never
  echoed raw.

## Project structure

```
src/
├── Controller/        # storefront, cart, order, payment, account, admin (EasyAdmin)
├── Entity/            # User, Address, Product, Category, Order, OrderDetails, Carrier, Headers
├── Form/              # typed forms (registration, address, order, contact, search…)
├── Repository/        # Doctrine repositories — parameterized queries only
├── Security/          # LoginAuthenticator (CSRF badge, target path)
├── Model/             # Cart, Search (DTOs)
└── Service/           # Mail (Mailjet)
templates/             # Twig views (auto-escaped)
migrations/            # Doctrine migrations
config/packages/       # security.yaml, doctrine.yaml, framework.yaml…
```

## Getting started

```bash
# 1. Install dependencies
composer install

# 2. Configure the database (see .env / doctrine.yaml), then:
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate

# 3. (Option) load the reference data
#    e-commerce-symfo.sql is provided as a data snapshot

# 4. Run the dev server
symfony serve
```

Or with Docker for the database:

```bash
docker compose up -d   # PostgreSQL container
```

Quality tooling: `vendor/bin/phpstan analyse`, `vendor/bin/rector process --dry-run`,
`php bin/phpunit`.

## Disclaimer

Academic lab project. Payment (Stripe) runs in test mode, the database dump
contains fictional data, and no real customer information is involved.
