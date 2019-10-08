require "spec_helper"

# EmailCampaign — почтовая рассылка.
#
# `#schedule_on` ставит рассылку на отправку в указанное время `date`.
# `#to_plain_text` собирает письмо в текстовом виде.
class EmailCampaign
  DEFAULT_PLAIN_TEXT_SIGNATURE = "\n\n--\n Awesome Mail.app, http://awesomemail.app/".freeze

  attr_reader :subject, :body, :scheduled_on

  def initialize(subject:, body:)
    @subject = subject
    @body = body
  end

  def schedule_on(date)
    @scheduled_on = date
  end

  def to_plain_text
    [subject_field, body_with_signature].join("\n")
  end

  private

  def subject_field
    "Subject: #{subject}"
  end

  def body_with_signature
    [body.strip, DEFAULT_PLAIN_TEXT_SIGNATURE].join
  end
end

RSpec.describe EmailCampaign do
  let(:email_campaign) { EmailCampaign.new(subject: "Test subject", body: "test body") }

  describe '#schedule_on' do
    it 'set scheduled date' do
      expect { email_campaign.schedule_on('10.10.2019') }.to change {email_campaign.scheduled_on}.to('10.10.2019')
    end
  end

  describe '#to_plain_text' do
    plain_mail_text = "Subject: Test subject\ntest body\n\n--\n Awesome Mail.app, http://awesomemail.app/"
    it 'return full email in text format' do
      expect(email_campaign.to_plain_text).to match(plain_mail_text)
    end
  end
end
