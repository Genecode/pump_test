require "spec_helper"

# DailySummaryController — контроллер, рассылающий письма с ежедневной активностью
# по проекту.
#
# `#test` отправляет тестовое письмо с активностью за день текущему пользователю.
# `#deliver` отправляет письма с активностью за день всем пользователям
# с включенными уведомлениями по почте.
class DailySummaryController
  attr_reader :current_user

  def initialize(current_user:)
    @current_user = current_user
  end

  def test
    DailySummaryEmail.new(recipient: current_user).test

    200
  end

  def deliver
    subscribers.each do |user|
      DailySummaryEmail.new(recipient: user).deliver
    end

    201
  end

  private

  def subscribers
    User.all.select(&:email_notifications_enabled?)
  end
end

class DailySummaryEmail
  attr_reader :recipient

  def initialize(recipient:)
    @recipient = recipient
  end

  def test
    # Собираем письмо для пользователя и отправляем его с пометкой [Test] в теме письма
  end

  def deliver
    # Собираем и отправляем письмо
  end
end

class User
  attr_reader :email, :email_notifications_enabled
  alias email_notifications_enabled? email_notifications_enabled

  def initialize(email:, email_notifications_enabled: true)
    @email = email
    @email_notifications_enabled = email_notifications_enabled
  end

  def self.all
    # Какая-то супер-сложная выборка пользователей из БД или внешнего API
  end
end

RSpec.describe DailySummaryController do
end
