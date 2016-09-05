require "spec_helper"

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
end
