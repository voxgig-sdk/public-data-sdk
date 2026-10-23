# PublicData SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module PublicDataFeatures
  def self.make_feature(name)
    case name
    when "base"
      PublicDataBaseFeature.new
    when "ratelimit"
      PublicDataRatelimitFeature.new
    when "retry"
      PublicDataRetryFeature.new
    when "test"
      PublicDataTestFeature.new
    when "timeout"
      PublicDataTimeoutFeature.new
    else
      PublicDataBaseFeature.new
    end
  end
end
