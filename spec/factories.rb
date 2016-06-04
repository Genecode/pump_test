FactoryGirl.define do
  factory :scale do
    impacts %w(low medium high)
    likelihoods %w(low medium high)
  end

  factory :risk do
    impact "low"
    likelihood "low"
    scale
  end
end
