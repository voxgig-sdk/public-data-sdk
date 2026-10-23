

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { PublicDataSDK, BaseFeature, config, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('SlugEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when PUBLIC_DATA_TEST_LIVE=TRUE.
  afterEach(liveDelay('PUBLIC_DATA_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = PublicDataSDK.test()
    const ent = testsdk.Slug()
    assert(null != ent)
  })


  test('validate', async (t) => {
    if (null == (config as any).feature?.validate) {
      t.skip('feature not present in this SDK: validate')
      return
    }
    const client = PublicDataSDK.test(undefined, { feature: { validate: { active: true } } })
    await assert.rejects(client.Slug().list({"slug":1} as any),
      (err: any) => 'validate_failed' === err.code)
  })



  test('basic', async (t) => {

    const live = 'TRUE' === process.env.PUBLIC_DATA_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'slug.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"key":{"a":true,"h":"Key","n":"key","r":false,"sh":"Stable identifier for the measure","t":"`$STRING`","key$":"key","index$":0},"label":{"a":true,"h":"Label","n":"label","r":false,"t":"`$STRING`","key$":"label","index$":1},"national_count":{"a":true,"h":"National Count","n":"national_count","r":false,"sh":"How many records the rank is out of","t":["`$ONE`",["`$INTEGER`","`$NULL`"]],"key$":"national_count","index$":2},"national_rank":{"a":true,"h":"National Rank","n":"national_rank","r":false,"sh":"Rank within this entity type only, respecting the direction of the measure, so a low value wins where low is better.","t":["`$ONE`",["`$INTEGER`","`$NULL`"]],"key$":"national_rank","index$":3},"unit":{"a":true,"h":"Unit","n":"unit","r":false,"t":["`$ONE`",["`$STRING`","`$NULL`"]],"key$":"unit","index$":4},"value":{"a":true,"h":"Value","n":"value","r":false,"sh":"null means the agency published no value for this record.","t":["`$ONE`",["`$NUMBER`","`$STRING`","`$NULL`"]],"key$":"value","index$":5}},"name":"slug","op":{"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /api/export/agency/{slug}.json","source":"openapi3","version":2},"g":{"params":[{"a":true,"ex":"department-of-the-treasury","k":"param","n":"slug","or":"slug","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/api/export/agency/{slug}.json","q":{"exist":["slug"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"api"},{"lit":"export"},{"lit":"agency"},{"lit":"{slug}.json"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0},{"a":true,"co":{"id":"GET /api/export/district/{slug}.json","source":"openapi3","version":2},"g":{"params":[{"a":true,"ex":"houston-isd","k":"param","n":"slug","or":"slug","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/api/export/district/{slug}.json","q":{"exist":["slug"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"api"},{"lit":"export"},{"lit":"district"},{"lit":"{slug}.json"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":1},{"a":true,"co":{"id":"GET /api/export/hospital/{slug}.json","source":"openapi3","version":2},"g":{"params":[{"a":true,"ex":"mayo-clinic-hospital-rochester","k":"param","n":"slug","or":"slug","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/api/export/hospital/{slug}.json","q":{"exist":["slug"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"api"},{"lit":"export"},{"lit":"hospital"},{"lit":"{slug}.json"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":2},{"a":true,"co":{"id":"GET /api/export/school/{slug}.json","source":"openapi3","version":2},"g":{"params":[{"a":true,"ex":"vashon-high","k":"param","n":"slug","or":"slug","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/api/export/school/{slug}.json","q":{"exist":["slug"]},"r":{},"rs":{"kind":"json","media":"application/json"},"s":[{"lit":"api"},{"lit":"export"},{"lit":"school"},{"lit":"{slug}.json"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":3}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"slug","name__orig":"slug","Name":"Slug","name_":"slug","name-":"slug","NAME":"SLUG","index$":0}, {"active":true,"entity":"slug","key$":"BasicSlugFlow","kind":"basic","name":"BasicSlugFlow","param":{},"step":[{"a":true,"d":{},"i":{},"m":{"slug":"slug01"},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"slug_ref01"}}],"index$":0}]}, 'Slug', {"GET /api/export/agency/{slug}.json":{"protocol":"http","parameters":[{"name":"slug","in":"path","required":true,"description":"The agency's stable slug, the same one its page uses at /agency/{slug}.","schema":{"type":"string","pattern":"^[a-z0-9-]+$"},"example":"department-of-the-treasury","x-ref":"#/components/parameters/agencySlug","index$":0}]},"GET /api/export/district/{slug}.json":{"protocol":"http","parameters":[{"name":"slug","in":"path","required":true,"description":"The district's stable slug, the same one its page uses at /district/{slug}.","schema":{"type":"string","pattern":"^[a-z0-9-]+$"},"example":"houston-isd","x-ref":"#/components/parameters/districtSlug","index$":0}]},"GET /api/export/hospital/{slug}.json":{"protocol":"http","parameters":[{"name":"slug","in":"path","required":true,"description":"The hospital's stable slug, the same one its page uses at /hospital/{slug}. Find one through /search or the sitemap; slugs never change once published.","schema":{"type":"string","pattern":"^[a-z0-9-]+$"},"example":"mayo-clinic-hospital-rochester","x-ref":"#/components/parameters/hospitalSlug","index$":0}]},"GET /api/export/school/{slug}.json":{"protocol":"http","parameters":[{"name":"slug","in":"path","required":true,"description":"The school's stable slug, the same one its page uses at /school/{slug}. Names collide heavily — hundreds of \"Lincoln High School\" — so resolve through /search rather than guessing, and see the us-public-data-lookup skill.","schema":{"type":"string","pattern":"^[a-z0-9-]+$"},"example":"vashon-high","x-ref":"#/components/parameters/schoolSlug","index$":0}]}}, { strict: LIVE_STRICT, t })
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let slug_ref01_data = Object.values(setup.data.existing.slug)[0] as any

    // LIST
    const slug_ref01_ent = client.Slug()
    const slug_ref01_match: any = {}
    slug_ref01_match['slug'] = setup.idmap['slug01']

    const slug_ref01_list = (await slug_ref01_ent.list(slug_ref01_match)).map((e: any) => e.data())


  })
})



// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true

function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/slug/SlugTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = PublicDataSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['slug01','slug02','slug03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'PUBLIC_DATA_TEST_SLUG_ENTID': idmap,
    'PUBLIC_DATA_TEST_LIVE': 'FALSE',
    'PUBLIC_DATA_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['PUBLIC_DATA_TEST_SLUG_ENTID']

  const live = 'TRUE' === env.PUBLIC_DATA_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['PUBLIC_DATA_TEST_SLUG_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new PublicDataSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.PUBLIC_DATA_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
