# frozen_string_literal: true

require_relative "chat_gpt/config"
require_relative "chat_gpt/api"
require_relative "chat_gpt/client"
require_relative "chat_gpt/engine" if defined?(Rails)
require_relative "chat_gpt/version"

module ChatGpt
  class Error < StandardError; end

  def self.logger
    config.logger
  end
end
