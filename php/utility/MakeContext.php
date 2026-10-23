<?php
declare(strict_types=1);

// PublicData SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class PublicDataMakeContext
{
    public static function call(array $ctxmap, ?PublicDataContext $basectx): PublicDataContext
    {
        return new PublicDataContext($ctxmap, $basectx);
    }
}
