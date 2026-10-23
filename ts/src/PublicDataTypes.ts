// Typed models for the PublicData SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Slug {
  key?: string
  label?: string
  national_count?: number | null
  national_rank?: number | null
  unit?: string | null
  value?: number | string | null
}

export interface SlugListMatch {
  slug: string
}

export interface Status {
  checked_at?: string
  shards?: Record<string, any>
  status?: string
}

export interface StatusLoadMatch {
  checked_at?: string
  shards?: Record<string, any>
  status?: string
}

