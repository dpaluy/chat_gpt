module ChatGpt
  class Api
    MODELS = %w[
      curie
      ada
      grace
      flora
      davinci
    ].freeze

    attr_reader :connection

    def initialize(params = {})
      @connection = ChatGpt::Client.new(params)
    end

    # rubocop:disable Layout/ArgumentAlignment
    def send(prompt, model: "curie", num_responses: 1, max_tokens: 100,
             temperature: 0.5, conversation_id: nil)
      response = connection.send_message(prompt,
        model: model, num_responses: num_responses, max_tokens: max_tokens,
        temperature: temperature, conversation_id: conversation_id)

      parse_resonse(JSON.parse(response.body)["data"])
    end
    # rubocop:enable Layout/ArgumentAlignment

    private

    def parse_resonse(response)
      {
        conversation_id: response[0]["conversation_id"],
        responses: response.map { |r| r["response"] }
      }
    end
  end
end
