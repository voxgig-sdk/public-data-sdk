# PublicData SDK feature factory

from publicdata_sdk.feature.base_feature import PublicDataBaseFeature
from publicdata_sdk.feature.ratelimit_feature import PublicDataRatelimitFeature
from publicdata_sdk.feature.retry_feature import PublicDataRetryFeature
from publicdata_sdk.feature.test_feature import PublicDataTestFeature
from publicdata_sdk.feature.timeout_feature import PublicDataTimeoutFeature


_FEATURES = {
    "base": lambda: PublicDataBaseFeature(),
    "ratelimit": lambda: PublicDataRatelimitFeature(),
    "retry": lambda: PublicDataRetryFeature(),
    "test": lambda: PublicDataTestFeature(),
    "timeout": lambda: PublicDataTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
