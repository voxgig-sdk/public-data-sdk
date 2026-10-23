# PublicData SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

PublicDataUtility.registrar = ->(u) {
  u.clean = PublicDataUtilities::Clean
  u.clean_add = PublicDataUtilities::CleanAdd
  u.clean_explain = PublicDataUtilities::CleanExplain
  u.done = PublicDataUtilities::Done
  u.make_error = PublicDataUtilities::MakeError
  u.feature_add = PublicDataUtilities::FeatureAdd
  u.feature_hook = PublicDataUtilities::FeatureHook
  u.feature_init = PublicDataUtilities::FeatureInit
  u.fetcher = PublicDataUtilities::Fetcher
  u.make_fetch_def = PublicDataUtilities::MakeFetchDef
  u.make_context = PublicDataUtilities::MakeContext
  u.make_options = PublicDataUtilities::MakeOptions
  u.make_request = PublicDataUtilities::MakeRequest
  u.make_response = PublicDataUtilities::MakeResponse
  u.make_result = PublicDataUtilities::MakeResult
  u.make_point = PublicDataUtilities::MakePoint
  u.make_spec = PublicDataUtilities::MakeSpec
  u.make_url = PublicDataUtilities::MakeUrl
  u.param = PublicDataUtilities::Param
  u.prepare_auth = PublicDataUtilities::PrepareAuth
  u.prepare_body = PublicDataUtilities::PrepareBody
  u.prepare_headers = PublicDataUtilities::PrepareHeaders
  u.prepare_method = PublicDataUtilities::PrepareMethod
  u.prepare_params = PublicDataUtilities::PrepareParams
  u.prepare_path = PublicDataUtilities::PreparePath
  u.prepare_query = PublicDataUtilities::PrepareQuery
  u.graphql_body = PublicDataUtilities::GraphqlBody
  u.graphql_errors = PublicDataUtilities::GraphqlErrors
  u.result_basic = PublicDataUtilities::ResultBasic
  u.result_body = PublicDataUtilities::ResultBody
  u.result_headers = PublicDataUtilities::ResultHeaders
  u.transform_request = PublicDataUtilities::TransformRequest
  u.transform_response = PublicDataUtilities::TransformResponse
}
