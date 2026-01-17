<?php

require __DIR__.'/vendor/autoload.php';

use Symfony\Component\Dotenv\Dotenv;

$dotenv = new Dotenv();
$dotenv->loadEnv(__DIR__.'/.env');

echo "APP_ENV = " . ($_ENV['APP_ENV'] ?? 'non défini') . "\n";
echo "DATABASE_URL = " . ($_ENV['DATABASE_URL'] ?? 'non défini') . "\n";