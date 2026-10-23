package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "PublicData",
			"slug": "public-data",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"now": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
		},
		"options": map[string]any{
			"base": "https://publicdatahub.org",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"slug": map[string]any{},
				"status": map[string]any{},
			},
		},
		"entity": map[string]any{
			"slug": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "key",
						"title": "Key",
						"type": "`$STRING`",
						"short": "Stable identifier for the measure",
					},
					map[string]any{
						"name": "label",
						"title": "Label",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "national_count",
						"title": "National Count",
						"type": []any{
							"`$ONE`",
							[]any{
								"`$INTEGER`",
								"`$NULL`",
							},
						},
						"short": "How many records the rank is out of",
					},
					map[string]any{
						"name": "national_rank",
						"title": "National Rank",
						"type": []any{
							"`$ONE`",
							[]any{
								"`$INTEGER`",
								"`$NULL`",
							},
						},
						"short": "Rank within this entity type only, respecting the direction of the measure, so a low value wins where low is better.",
					},
					map[string]any{
						"name": "unit",
						"title": "Unit",
						"type": []any{
							"`$ONE`",
							[]any{
								"`$STRING`",
								"`$NULL`",
							},
						},
					},
					map[string]any{
						"name": "value",
						"title": "Value",
						"type": []any{
							"`$ONE`",
							[]any{
								"`$NUMBER`",
								"`$STRING`",
								"`$NULL`",
							},
						},
						"short": "null means the agency published no value for this record.",
					},
				},
				"name": "slug",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/export/agency/{slug}.json",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "export",
									},
									map[string]any{
										"lit": "agency",
									},
									map[string]any{
										"lit": "{slug}.json",
									},
								},
								"parts": []any{
									"api",
									"export",
									"agency",
									"{slug}.json",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "slug",
											"orig": "slug",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "department-of-the-treasury",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"slug",
									},
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/export/district/{slug}.json",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "export",
									},
									map[string]any{
										"lit": "district",
									},
									map[string]any{
										"lit": "{slug}.json",
									},
								},
								"parts": []any{
									"api",
									"export",
									"district",
									"{slug}.json",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "slug",
											"orig": "slug",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "houston-isd",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"slug",
									},
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/export/hospital/{slug}.json",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "export",
									},
									map[string]any{
										"lit": "hospital",
									},
									map[string]any{
										"lit": "{slug}.json",
									},
								},
								"parts": []any{
									"api",
									"export",
									"hospital",
									"{slug}.json",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "slug",
											"orig": "slug",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "mayo-clinic-hospital-rochester",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"slug",
									},
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/export/school/{slug}.json",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "export",
									},
									map[string]any{
										"lit": "school",
									},
									map[string]any{
										"lit": "{slug}.json",
									},
								},
								"parts": []any{
									"api",
									"export",
									"school",
									"{slug}.json",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "slug",
											"orig": "slug",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "vashon-high",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"slug",
									},
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"status": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "checked_at",
						"title": "Checked At",
						"type": "`$STRING`",
						"format": "date-time",
					},
					map[string]any{
						"name": "shards",
						"title": "Shards",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "status",
						"title": "Status",
						"type": "`$STRING`",
					},
				},
				"name": "status",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/status",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "status",
									},
								},
								"parts": []any{
									"api",
									"status",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
