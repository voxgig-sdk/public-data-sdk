# Typed models for the PublicData SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Slug(TypedDict, total=False):
    key: str
    label: str
    national_count: int | None
    national_rank: int | None
    unit: str | None
    value: float | str | None


class SlugListMatch(TypedDict):
    slug: str


class Status(TypedDict, total=False):
    checked_at: str
    shards: dict
    status: str


class StatusLoadMatch(TypedDict, total=False):
    checked_at: str
    shards: dict
    status: str
