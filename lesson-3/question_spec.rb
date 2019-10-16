require "spec_helper"

# Question — вопрос, на который отвечают эксперты.
#
# `#answer` возвращает наиболее полезный ответ.
# `#address_to` пересылает вопрос эксперту почтой.
class Question
  attr_reader :summary, :responses

  def initialize(summary:, responses: [])
    @summary = summary
    @responses = responses
  end

  def answer
    responses.sort_by(&:score).reverse.first
  end

  def address_to(expert)
    QuestionMail.new(self, recipient: expert).deliver
  end
end

class Response
  attr_reader :text, :author

  def initialize(text:, author:)
    @text = text
    @author = author
  end

  def score
    ResponseText.new(text).score
  end
end

class ResponseText
  def initialize(response)
    @response = response
  end

  def score
    # Возвращаем число, полезность ответа. Учитываем:
    #   — наличие опечаток через HTTP API;
    #   — наличие картинок в тексте;
    #   — количество и качество текста (через API Главреда).
  end
end

class QuestionMail
  def initialize(question, recipient:)
    @question = question
    @recipient = recipient
  end

  def deliver
    # Собираем и отправляем письмо с вопросом получателю (`recipient`)
  end
end

RSpec.describe Question do
  subject { described_class.new(summary: true) }

  it { is_expected.to have_attributes(summary: true) }
  it { is_expected.to have_attributes(responses: []) }

  describe "#answer" do
    let(:responses) do
      (1..5).map { |score| instance_double(Response, score: score) }.shuffle
    end
    let(:question) { described_class.new(summary: true, responses: responses) }

    it "returns answer with most score" do
      expect(question.answer.score).to be 5
    end
  end

  describe "#address_to" do
    let(:question) { described_class.new(summary: true) }
    let(:question_mail) { instance_double(QuestionMail, deliver: true) }
    let(:recipient) { double }

    it "sends email with question to recipient" do
      allow(QuestionMail)
        .to receive(:new)
        .with(question, recipient: recipient)
        .and_return(question_mail)


      question.address_to(recipient)

      expect(question_mail).to have_received(:deliver)
    end
  end
end
