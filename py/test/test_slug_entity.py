# Slug entity test

import json
import os
import time

import pytest

from publicdata_sdk.utility.voxgig_struct import voxgig_struct as vs
from publicdata_sdk import PublicDataSDK
from publicdata_sdk.core import helpers
from publicdata_sdk.config import shared_config
from publicdata_sdk.feature.base_feature import PublicDataBaseFeature

_TEST_DIR = os.path.dirname(os.path.abspath(__file__))
from test import runner



# main.kit.test.live.strict is true (the default is true): a live
# request that fails, or a live test missing an input it needs,
# fails the test.
# An account with no record for a test to read skips it either way.
LIVE_STRICT = True


class TestSlugEntity:

    def test_should_create_instance(self):
        testsdk = PublicDataSDK.test(None, None)
        ent = testsdk.Slug(None)
        assert ent is not None

    def test_should_refuse_an_invalid_request(self):
        if "validate" not in (shared_config().get("feature") or {}):
            pytest.skip("feature not present in this SDK: validate")
        client = PublicDataSDK.test(
            None, {"feature": {"validate": {"active": True}}})
        with pytest.raises(Exception) as err:
            client.Slug(None).list({"slug": 1}, None)
        assert "validate_failed" == getattr(err.value, "code", None)

    def test_should_run_basic_flow(self):
        setup = _slug_basic_setup(None)
        # Per-op sdk-test-control.json skip — basic test exercises a flow with
        # multiple ops; skipping any one skips the whole flow (steps depend
        # on each other).
        _live = setup.get("live", False)
        for _op in ["list"]:
            _skip, _reason = runner.is_control_skipped("entityOp", "slug." + _op, "live" if _live else "unit")
            if _skip:
                pytest.skip(_reason or "skipped via sdk-test-control.json")
                return
        if setup["live"]:
            for _live_key in ["slug01"]:
                if setup.get("synthetic_only") or setup["idmap"].get(_live_key) is None:
                    runner.live_miss(LIVE_STRICT, f"Live entity test blocked: needs {_live_key} via PUBLIC_DATA_TEST_SLUG_ENTID")
        client = setup["client"]

        # Bootstrap entity data from existing test data.
        slug_ref01_data_raw = vs.items(helpers.to_map(
            vs.getpath(setup["data"], "existing.slug")))
        slug_ref01_data = None
        if len(slug_ref01_data_raw) > 0:
            slug_ref01_data = helpers.to_map(slug_ref01_data_raw[0][1])

        # LIST
        slug_ref01_ent = client.Slug(None)
        slug_ref01_match = {
            "slug": setup["idmap"]["slug01"],
        }

        slug_ref01_list_result = slug_ref01_ent.list(slug_ref01_match, None)
        assert isinstance(slug_ref01_list_result, list)



def _slug_basic_setup(extra):
    runner.load_env_local()

    entity_data_file = os.path.join(_TEST_DIR, "../../.sdk/test/entity/slug/SlugTestData.json")
    with open(entity_data_file, "r", encoding="utf-8") as f:
        entity_data_source = f.read()

    entity_data = json.loads(entity_data_source)

    options = {}
    options["entity"] = entity_data.get("existing")

    client = PublicDataSDK.test(options, extra)

    # Generate idmap via transform.
    idmap = vs.transform(
        ["slug01", "slug02", "slug03"],
        {
            "`$PACK`": ["", {
                "`$KEY`": "`$COPY`",
                "`$VAL`": ["`$FORMAT`", "upper", "`$COPY`"],
            }],
        }
    )

    # Whether *_ENTID supplied the idmap, read before env_override consumes
    # it: without it, the ids a live flow binds are the fixture's synthetic ones.
    _entid_env_raw = os.environ.get(
        "PUBLIC_DATA_TEST_SLUG_ENTID")
    _idmap_overridden = _entid_env_raw is not None and _entid_env_raw.strip().startswith("{")

    env = runner.env_override({
        "PUBLIC_DATA_TEST_SLUG_ENTID": idmap,
        "PUBLIC_DATA_TEST_LIVE": "FALSE",
        "PUBLIC_DATA_TEST_EXPLAIN": "FALSE",
    })

    idmap_resolved = helpers.to_map(
        env.get("PUBLIC_DATA_TEST_SLUG_ENTID"))
    if idmap_resolved is None:
        idmap_resolved = helpers.to_map(idmap)

    if env.get("PUBLIC_DATA_TEST_LIVE") == "TRUE":
        merged_opts = vs.merge([
            # FIRST, so the generated fields below win: sdk-test-control.json's
            # test.client.options adds to the live client, it does not
            # redirect it.
            runner.live_client_options(),
            {
            },
            extra or {},
        ])
        client = PublicDataSDK(helpers.to_map(merged_opts))

    _live = env.get("PUBLIC_DATA_TEST_LIVE") == "TRUE"
    return {
        "client": client,
        "data": entity_data,
        "idmap": idmap_resolved,
        "env": env,
        "explain": env.get("PUBLIC_DATA_TEST_EXPLAIN") == "TRUE",
        "live": _live,
        "synthetic_only": _live and not _idmap_overridden,
        "now": int(time.time() * 1000),
    }
