require "spec_helper"

RSpec.describe ChatGpt::Client do
  let(:api_url) { "https://api.openai.com/v1/chatgpt/generate" }
  let(:valid_key) { "valid_key" }
  let(:success_response) do
    {
      "data": [
        {
          "response": "Hello, how are you?",
          "conversation_id": "abc123"
        }
      ]
    }.to_json
  end

  it "should accept a key" do
    expect(described_class.new(api_key: "test")).to be_an_instance_of(ChatGpt::Client)
  end

  describe "#send_message" do
    before do
      stub_request(:post, api_url)
        .with(
          body: {
            "prompt" => prompt,
            "model" => "curie",
            "num_responses" => 1,
            "max_tokens" => 100,
            "temperature" => 0.5,
            "conversation_id" => nil
          }.to_json,
          headers: {
            "Content-Type" => "application/json",
            "Authorization" => "Bearer #{valid_key}",
            "Host" => "api.openai.com",
            "User-Agent" => "Ruby"
          }
        )
        .to_return(
          status: 200,
          body: success_response,
          headers: {
            "Content-Type" => "application/json"
          }
        )
    end

    let(:prompt) { "Hello" }

    it "should make a request to open api" do
      client = ChatGpt::Client.new(api_key: valid_key)
      response = client.send_message(prompt)
      expect(response.body).to eq(success_response)
    end
  end
end
