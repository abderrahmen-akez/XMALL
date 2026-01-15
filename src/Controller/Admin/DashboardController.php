<?php

namespace Xmall\Controller\Admin;

use Xmall\Entity\Carrier;
use Xmall\Entity\Category;
use Xmall\Entity\Headers;
use Xmall\Entity\Order;
use Xmall\Entity\Product;
use Xmall\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    public function __construct(private readonly \EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator $adminUrlGenerator)
    {
    }
    #[Route(path: '/admin', name: 'admin')]
    public function index(): Response
    {
        // redirect to some CRUD controller
        $routeBuilder = $this->adminUrlGenerator;

        return $this->redirect($routeBuilder->setController(OrderCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('XMALL');

    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Tableau de bord', 'fa fa-home');
        yield MenuItem::linkToCrud('Utilisateurs', 'fas fa-user', User::class);
        yield MenuItem::linkToCrud('Catégories', 'fas fa-list', Category::class);
        yield MenuItem::linkToCrud('Produits', 'fas fa-tag', Product::class);
        yield MenuItem::linkToCrud('Transporteurs', 'fas fa-truck', Carrier::class);
        yield MenuItem::linkToCrud('Commandes', 'fas fa-shopping-cart', Order::class);
        yield MenuItem::linkToCrud('Bannières', 'fas fa-desktop', Headers::class);
    }
}
