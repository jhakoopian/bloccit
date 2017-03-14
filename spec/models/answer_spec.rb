require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.new(title: "New Question Title", body: "New Question Body", resolved: false) }
  let(:answer) { Answer.new(question: question, body: "New Answer Body") }

  # it "should respond to body" do
  #   expect(question).to respond_to(:body)
  # end

  describe "attributes" do
    it "has a body attribute" do
      expect(answer).to have_attributes(body: "New Answer Body")
    end
  end
end
