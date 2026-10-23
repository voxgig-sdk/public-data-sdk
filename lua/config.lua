-- PublicData SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "PublicData",
      slug = "public-data",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["now"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
    },
    options = {
      base = "https://publicdatahub.org",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["slug"] = {},
        ["status"] = {},
      },
    },
    entity = {
      ["slug"] = {
        ["fields"] = {
          {
            ["name"] = "key",
            ["title"] = "Key",
            ["type"] = "`$STRING`",
            ["short"] = "Stable identifier for the measure",
          },
          {
            ["name"] = "label",
            ["title"] = "Label",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "national_count",
            ["title"] = "National Count",
            ["type"] = {
              "`$ONE`",
              {
                "`$INTEGER`",
                "`$NULL`",
              },
            },
            ["short"] = "How many records the rank is out of",
          },
          {
            ["name"] = "national_rank",
            ["title"] = "National Rank",
            ["type"] = {
              "`$ONE`",
              {
                "`$INTEGER`",
                "`$NULL`",
              },
            },
            ["short"] = "Rank within this entity type only, respecting the direction of the measure, so a low value wins where low is better.",
          },
          {
            ["name"] = "unit",
            ["title"] = "Unit",
            ["type"] = {
              "`$ONE`",
              {
                "`$STRING`",
                "`$NULL`",
              },
            },
          },
          {
            ["name"] = "value",
            ["title"] = "Value",
            ["type"] = {
              "`$ONE`",
              {
                "`$NUMBER`",
                "`$STRING`",
                "`$NULL`",
              },
            },
            ["short"] = "null means the agency published no value for this record.",
          },
        },
        ["name"] = "slug",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/export/agency/{slug}.json",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "export",
                  },
                  {
                    ["lit"] = "agency",
                  },
                  {
                    ["lit"] = "{slug}.json",
                  },
                },
                ["parts"] = {
                  "api",
                  "export",
                  "agency",
                  "{slug}.json",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "slug",
                      ["orig"] = "slug",
                      ["type"] = "`$STRING`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = "department-of-the-treasury",
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "slug",
                  },
                },
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/export/district/{slug}.json",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "export",
                  },
                  {
                    ["lit"] = "district",
                  },
                  {
                    ["lit"] = "{slug}.json",
                  },
                },
                ["parts"] = {
                  "api",
                  "export",
                  "district",
                  "{slug}.json",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "slug",
                      ["orig"] = "slug",
                      ["type"] = "`$STRING`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = "houston-isd",
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "slug",
                  },
                },
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/export/hospital/{slug}.json",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "export",
                  },
                  {
                    ["lit"] = "hospital",
                  },
                  {
                    ["lit"] = "{slug}.json",
                  },
                },
                ["parts"] = {
                  "api",
                  "export",
                  "hospital",
                  "{slug}.json",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "slug",
                      ["orig"] = "slug",
                      ["type"] = "`$STRING`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = "mayo-clinic-hospital-rochester",
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "slug",
                  },
                },
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/export/school/{slug}.json",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "export",
                  },
                  {
                    ["lit"] = "school",
                  },
                  {
                    ["lit"] = "{slug}.json",
                  },
                },
                ["parts"] = {
                  "api",
                  "export",
                  "school",
                  "{slug}.json",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "slug",
                      ["orig"] = "slug",
                      ["type"] = "`$STRING`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                      ["example"] = "vashon-high",
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "slug",
                  },
                },
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["status"] = {
        ["fields"] = {
          {
            ["name"] = "checked_at",
            ["title"] = "Checked At",
            ["type"] = "`$STRING`",
            ["format"] = "date-time",
          },
          {
            ["name"] = "shards",
            ["title"] = "Shards",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "status",
            ["title"] = "Status",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "status",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/status",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "status",
                  },
                },
                ["parts"] = {
                  "api",
                  "status",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {},
                ["select"] = {},
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
