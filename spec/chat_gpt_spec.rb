# frozen_string_literal: true

RSpec.describe ChatGpt do
  it "has a version number" do
    expect(ChatGpt::VERSION).not_to be nil
  end
end
