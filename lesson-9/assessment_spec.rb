require "spec_helper"

class Scale < ActiveRecord::Base
  validates :impacts, :likelihoods, presence: true
end

class Risk < ActiveRecord::Base
  belongs_to :scale
end

class Assessment
  delegate :impacts, :likelihoods, to: :scale
  delegate :impact, :likelihood, to: :risk

  def initialize(risk, scale)
    @risk, @scale = risk, scale
  end

  def score
    impact_score * likelihood_score
  end

  private

  attr_reader :scale, :risk

  def impact_score
    score = impacts.index(impact) || 0

    score + 1
  end

  def likelihood_score
    score = likelihoods.index(likelihood) || 0

    score + 1
  end
end

RSpec.describe Assessment, ar: true do
  describe "#score" do
  end
end

