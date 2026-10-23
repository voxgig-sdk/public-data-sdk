# PublicData SDK utility: make_context
require_relative '../core/context'
module PublicDataUtilities
  MakeContext = ->(ctxmap, basectx) {
    PublicDataContext.new(ctxmap, basectx)
  }
end
