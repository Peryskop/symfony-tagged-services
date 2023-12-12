<?php

declare(strict_types=1);

namespace App\Action;

use App\Factory\ResponseFactoryInterface;
use Symfony\Component\HttpFoundation\Response;

final class SomeAction
{
    public function __construct(
        private readonly ResponseFactoryInterface $responseFactory,
    ) {
    }

    public function __invoke(): Response
    {
        return $this->responseFactory->createResponse();
    }
}
