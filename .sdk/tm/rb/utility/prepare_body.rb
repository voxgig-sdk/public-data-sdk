# PublicData SDK utility: prepare_body
require_relative 'media'
module PublicDataUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return PublicDataUtilities.raw_body(ctx.reqdata) if PublicDataUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
