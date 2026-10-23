<?php
declare(strict_types=1);

// Typed models for the PublicData SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Slug entity data model. */
class Slug
{
    public ?string $key = null;
    public ?string $label = null;
    public mixed $national_count = null;
    public mixed $national_rank = null;
    public mixed $unit = null;
    public mixed $value = null;
}

/** Request payload for Slug#list. */
class SlugListMatch
{
    public string $slug;
}

/** Status entity data model. */
class Status
{
    public ?string $checked_at = null;
    public ?array $shards = null;
    public ?string $status = null;
}

/** Request payload for Status#load. */
class StatusLoadMatch
{
    public ?string $checked_at = null;
    public ?array $shards = null;
    public ?string $status = null;
}

