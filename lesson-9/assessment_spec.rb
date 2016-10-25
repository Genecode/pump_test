require "spec_helper"

# Assessment — оценка вероятности и последствий риска (Risk) по шкале (Scale)
class Assessment
  delegate :impacts, :likelihoods, to: :scale
  delegate :impact, :likelihood, to: :risk

  def initialize(risk, scale)
    @risk = risk
    @scale = scale
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

class Risk < ActiveRecord::Base
  belongs_to :scale
end

class Scale < ActiveRecord::Base
  serialize :impacts
  serialize :likelihoods

  validates :impacts, :likelihoods, presence: true
  validate :impacts_and_likelihoods_should_be_iterable

  private

  def impacts_and_likelihoods_should_be_iterable
    errors.add(:impacts, "should be array-like") unless impacts.respond_to?(:each)
    errors.add(:likelihoods, "should be array-like") unless likelihoods.respond_to?(:each)
  end
end

RSpec.describe Assessment, ar: true do
  describe "#score" do
  end
end
