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
  let(:email_campaign) { described_class.new(subject: "Test subject", body: " Test body  ") }

  describe '#schedule_on' do
    it 'sets scheduled date' do
      expect { email_campaign.schedule_on('10.10.2019') }
        .to change { email_campaign.scheduled_on }.to('10.10.2019')
    end
  end

  describe '#to_plain_text' do
    subject { email_campaign.to_plain_text }


    it { is_expected.to start_with('Subject: Test subject') }
    it "strips whitespaces from body" do
      expect(subject).to match(/^Test body$/)
    end

    it "joins all email parts with newline" do
      sign = described_class::DEFAULT_PLAIN_TEXT_SIGNATURE
      expect(subject).to eq("Subject: Test subject\nTest body#{sign}")
    end
  end
end
