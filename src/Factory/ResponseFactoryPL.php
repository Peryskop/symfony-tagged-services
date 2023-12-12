<?php

declare(strict_types=1);

namespace App\Factory;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

final class ResponseFactoryPL implements ResponseFactoryInterface
{
    public function createResponse(): Response
    {
        return new JsonResponse([
            'message' => 'Dzień dobry'
        ]);
    }
}
