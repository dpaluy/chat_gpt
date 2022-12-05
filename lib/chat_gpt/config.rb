require "logger"

module ChatGpt
  class Config
    attr_accessor :key
    attr_writer :logger

    def logger
      @logger ||= Logger.new($stderr)
    end
  end

  def self.configure
    yield config
  end

  def self.config
    @config ||= Config.new
  end
end
