require "spec_helper"

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
end
