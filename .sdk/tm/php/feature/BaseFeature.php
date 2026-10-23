<?php
declare(strict_types=1);

// PublicData SDK base feature

class PublicDataBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(PublicDataContext $ctx, array $options): void {}
    public function PostConstruct(PublicDataContext $ctx): void {}
    public function PostConstructEntity(PublicDataContext $ctx): void {}
    public function SetData(PublicDataContext $ctx): void {}
    public function GetData(PublicDataContext $ctx): void {}
    public function GetMatch(PublicDataContext $ctx): void {}
    public function SetMatch(PublicDataContext $ctx): void {}
    public function PrePoint(PublicDataContext $ctx): void {}
    public function PreSpec(PublicDataContext $ctx): void {}
    public function PreRequest(PublicDataContext $ctx): void {}
    public function PreResponse(PublicDataContext $ctx): void {}
    public function PreResult(PublicDataContext $ctx): void {}
    public function PreDone(PublicDataContext $ctx): void {}
    public function PreUnexpected(PublicDataContext $ctx): void {}
}
