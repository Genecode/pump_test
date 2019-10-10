require "spec_helper"
# Alarm — будильник, установленный на определенное время (`at`).
#
# `#to_human_string` возвращает время в человеческом формате: 22:30, 6:50.
# `#snooze_for` откладывает будильник, дает вздремнуть еще `minutes` минут.
class Alarm
  attr_accessor :at

  def initialize(at:)
    @at = at
  end

  def to_human_string
    at.strftime("%k:%M").strip
  end

  def snooze_for(minutes)
    self.at = at + minutes * 60
  end
end

RSpec.describe Alarm do
  describe "#to_human_string" do
    context "when afternoon" do
      let(:time) { Time.local(2019, 10, 9, 10, 35) }
      let(:alarm) { described_class.new(at: time) }

      it "returns time`s string" do
        expect(alarm.to_human_string).to eq("10:35")
      end
    end

    context "when forenoon" do
      let(:time) { Time.local(2019, 10, 9, 2, 35) }
      let(:alarm) { described_class.new(at: time) }

      it "returns stripped time`s string" do
        expect(alarm.to_human_string).to eq("2:35")
      end
    end
  end

  describe "#snooze_for" do
    let(:alarm) { described_class.new(at: 0) }

    it "snoozes alarm timer for given minute" do
      expect { alarm.snooze_for(5) }.to change { alarm.at }.by(5.minutes)
    end
  end
end
