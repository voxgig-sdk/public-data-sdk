-- Typed models for the PublicData SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
-- params (op.<name>.points[].g.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Slug
---@field key? string
---@field label? string
---@field national_count? number|nil
---@field national_rank? number|nil
---@field unit? string|nil
---@field value? number|string|nil

---@class SlugListMatch
---@field slug string

---@class Status
---@field checked_at? string
---@field shards? table
---@field status? string

---@class StatusLoadMatch
---@field checked_at? string
---@field shards? table
---@field status? string

local M = {}

return M
