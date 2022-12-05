# frozen_string_literal: true

require_relative "lib/chat_gpt/version"

Gem::Specification.new do |spec|
  spec.name = "chat_gpt"
  spec.version = ChatGpt::VERSION
  spec.authors = ["dpaluy"]
  spec.email = ["dpaluy@users.noreply.github.com"]

  spec.summary = "This is OpenAI's ChatGPT API wrapper for Ruby."
  spec.description = "This is OpenAI's ChatGPT API wrapper for Ruby."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.homepage = "https://github.com/dpaluy/chat_gpt"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dpaluy/chat_gpt"
  spec.metadata["changelog_uri"] = "https://github.com/dpaluy/chat_gpt/releases"

  spec.files = Dir["README.md", "lib/**/*"]
end
