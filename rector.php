<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\SetList;
use Rector\Symfony\Set\SymfonySetList;
use Rector\Symfony\Set\SymfonyLevelSetList;

return static function (RectorConfig $rectorConfig): void {
    $rectorConfig->paths([
        __DIR__ . '/src',
        // Ajoute si besoin : __DIR__ . '/config', __DIR__ . '/templates'
    ]);

    // Optionnel : Pour des règles avancées comme StringFormTypeToClassRector
    $rectorConfig->symfonyContainerXml(__DIR__ . '/var/cache/dev/Xmall_KernelDevDebugContainer.xml');  // Change App_ en Xmall_ si namespace modifié

    // Sets pour upgrade Symfony 6.0+ (inclut code quality, constructor injection, etc.)
    $rectorConfig->sets([
        SetList::CODE_QUALITY,
        SetList::TYPE_DECLARATION,
        SymfonySetList::SYMFONY_60,               // Pour Symfony 6.0 base
        SymfonySetList::SYMFONY_CODE_QUALITY,
        SymfonySetList::SYMFONY_CONSTRUCTOR_INJECTION,
        // Ajoute si besoin : SymfonyLevelSetList::UP_TO_SYMFONY_64  (pour incremental)
    ]);

    // Si tu veux fixer annotations -> attributes (Symfony 6+ aime ça)
    $rectorConfig->sets([
        SymfonySetList::ANNOTATIONS_TO_ATTRIBUTES,
    ]);
};