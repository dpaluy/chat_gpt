require "spec_helper"

RSpec.describe ChatGpt::Api do
  let(:connection_params) do
    { api_key: "valid_key" }
  end
  let(:connection_mock) { instance_double("Api") }

  it "initializes a valid connection" do
    expect(ChatGpt::Client).to receive(:new).with(connection_params).and_return(connection_mock)
    ChatGpt::Api.new(connection_params)
  end

  describe "#send" do
    subject { ChatGpt::Api.new(connection_params) }

    let(:prompt) { "Hello" }
    let(:mocked_response) { double("Response", body: success_body) }
    let(:success_body) do
      {
        "data": [
          {
            "response": "Hello, how are you?",
            "conversation_id": "abc123"
          }
        ]
      }.to_json
    end

    before do
      allow(ChatGpt::Client).to receive(:new).with(connection_params).and_return(connection_mock)
    end

    it "sends a message to the connection and parse the response" do
      expect(connection_mock).to receive(:send_message).and_return(mocked_response)
      result = subject.send(prompt)
      expect(result).to eq(
        {
          conversation_id: "abc123",
          responses: ["Hello, how are you?"]
        }
      )
    end
  end
end
