<?php

declare(strict_types=1);

namespace App\Factory;

use Symfony\Component\HttpFoundation\Response;

interface ResponseFactoryInterface
{
    public function createResponse(): Response;
}
