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
  let (:time) { Time.local(2019, 10, 9, 10, 35) }
  let(:alarm) { Alarm.new(at: time) }

  describe '#to_human_string' do
    it 'return 10:35' do
      expect(alarm.to_human_string).to eq('10:35')
    end
  end

  describe '#snooze_for' do
    it 'increase alarm timer on 5 min' do
      expect { alarm.snooze_for(5) }.to change { alarm.at }.by(5.minute)
    end
  end
end
