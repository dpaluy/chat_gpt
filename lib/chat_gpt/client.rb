require "json"
require "net/http"

module ChatGpt
  class Client
    # Set the URL for the ChatGPT API
    API_URL = "https://api.openai.com/v1/chatgpt/generate".freeze

    attr_reader :api_key

    # Initialize the class with the API key
    def initialize(params = {})
      @api_key = params.fetch(:api_key, ChatGpt.config.key)
    end

    # Send a message to ChatGPT and return the response and conversation ID
    def send_message(prompt,
                     model: "curie", num_responses: 1, max_tokens: 100,
                     temperature: 0.5, conversation_id: nil)
      headers = {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{api_key}"
      }

      body = {
        prompt: prompt, model: model,
        num_responses: num_responses, max_tokens: max_tokens,
        temperature: temperature, conversation_id: conversation_id
      }.to_json

      Net::HTTP.post(URI(API_URL), body, headers)
    end
  end
end
