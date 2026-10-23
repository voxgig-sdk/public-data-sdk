package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewSlugEntityFunc func(client *PublicDataSDK, entopts map[string]any) PublicDataEntity

var NewStatusEntityFunc func(client *PublicDataSDK, entopts map[string]any) PublicDataEntity

