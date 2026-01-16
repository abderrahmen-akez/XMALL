<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Doctrine\Set\DoctrineSetList;
use Rector\Set\ValueObject\LevelSetList;
use Rector\Symfony\Set\SymfonySetList;

return RectorConfig::configure()
    ->withPaths([
        __DIR__ . '/src',   // Tes controllers, entities, etc.
        __DIR__ . '/tests', // Si tu as des tests
    ])
    ->withPhpSets()  // Auto-détecte ta version PHP depuis composer.json
    ->withSymfonyContainerXml(__DIR__ . '/var/cache/dev/App_KernelDevDebugContainer.xml') // Pour autowiring précis
    ->withSets([
        LevelSetList::UP_TO_PHP_82,  // Ou UP_TO_PHP_83 si t'es sur 8.3
        SymfonySetList::SYMFONY_74,
        SymfonySetList::SYMFONY_CODE_QUALITY,
        SymfonySetList::SYMFONY_CONSTRUCTOR_INJECTION,
        DoctrineSetList::ANNOTATIONS_TO_ATTRIBUTES,  // Doctrine @ORM → #[ORM]
        SymfonySetList::ANNOTATIONS_TO_ATTRIBUTES,   // Symfony @Route → #[Route] (inclut Sensio legacy)
    ])
    // Alternative moderne (recommandée en 2026) : auto-détecte tous les attributes installés
    // ->withAttributesSets(symfony: true, doctrine: true)  // Décommente si tu veux tester
;