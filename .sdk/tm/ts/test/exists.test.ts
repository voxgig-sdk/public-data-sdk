
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { PublicDataSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = PublicDataSDK.test()
    equal(testsdk instanceof PublicDataSDK, true,
      'PublicDataSDK.test() must return a client synchronously')
  })

})
