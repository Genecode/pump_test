FactoryGirl.define do
  factory :scale do
    impacts %w(low medium high)
    likelihoods %w(low medium high)
  end

  factory :risk do
    risk "low"
    likelihood "low"
  end
end
