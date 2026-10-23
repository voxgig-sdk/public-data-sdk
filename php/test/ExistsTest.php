<?php
declare(strict_types=1);

// PublicData SDK exists test

require_once __DIR__ . '/../publicdata_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = PublicDataSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
