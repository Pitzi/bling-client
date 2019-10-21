require "support"
require "bling/version"
require "bling/v2/invoice"
require "bling/v2/fail_result"
require "bling/v2/success_result"
require "bling/v2/response_handler"
require "bling/v2/fail_result"
require "bling/development_rest_client_adapter"

module Bling
  class << self
    attr_accessor :logger, :apikey, :environment

    def environment= environment
      @environment = Environment.new(environment)
    end

    alias_method :env, :environment
  end

  def self.configure
    yield self
  end
end


class Environment
  class UnknownEnvironment < StandardError; end
  ENVIRONMENTS = {
    development: "development",
    test: "test",
    production: "production"
  }
  def initialize(environment)
    raise UnknownEnvironment unless ENVIRONMENTS.values.include?(environment)
    @environment = environment
  end

  ENVIRONMENTS.each do|key, value|
    define_method("#{key}?") do
      @environment == value
    end
  end

  def to_s
    @environment
  end
end

Bling.configure do |bling|
  bling.environment = "development"

end
