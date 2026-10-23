# frozen_string_literal: true

# Typed models for the PublicData SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Slug entity data model.
#
# @!attribute [rw] key
#   @return [String, nil]
#
# @!attribute [rw] label
#   @return [String, nil]
#
# @!attribute [rw] national_count
#   @return [Object, nil]
#
# @!attribute [rw] national_rank
#   @return [Object, nil]
#
# @!attribute [rw] unit
#   @return [Object, nil]
#
# @!attribute [rw] value
#   @return [Object, nil]
Slug = Struct.new(
  :key,
  :label,
  :national_count,
  :national_rank,
  :unit,
  :value,
  keyword_init: true
)

# Request payload for Slug#list.
#
# @!attribute [rw] slug
#   @return [String]
SlugListMatch = Struct.new(
  :slug,
  keyword_init: true
)

# Status entity data model.
#
# @!attribute [rw] checked_at
#   @return [String, nil]
#
# @!attribute [rw] shards
#   @return [Hash, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
Status = Struct.new(
  :checked_at,
  :shards,
  :status,
  keyword_init: true
)

# Request payload for Status#load.
#
# @!attribute [rw] checked_at
#   @return [String, nil]
#
# @!attribute [rw] shards
#   @return [Hash, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
StatusLoadMatch = Struct.new(
  :checked_at,
  :shards,
  :status,
  keyword_init: true
)

