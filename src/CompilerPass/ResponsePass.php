<?php

declare(strict_types=1);

namespace App\CompilerPass;

use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Reference;

final class ResponsePass implements CompilerPassInterface
{
    public function process(ContainerBuilder $container): void
    {
        $definition = $container->getDefinition('action.some_action');

        $taggedServices = $container->findTaggedServiceIds('factory.response');

        foreach ($taggedServices as $id => $tags) {
            if ($tags[0]['region'] === $_ENV['REGION']) {
                $definition->addArgument(new Reference($id));
            }
        }
    }
}
