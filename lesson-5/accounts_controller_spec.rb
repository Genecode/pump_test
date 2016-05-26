require "spec_helper"

REPOSITORY = {
  account: [],
  pending_account: []
}.freeze

def create_list(what, amount)
  model = double(what)
  amount.times { REPOSITORY[what] << model }

  REPOSITORY[what]
end

class Account
  def self.active
    REPOSITORY[:account]
  end
end

RSpec.describe Account do
  context "#active" do
    before do
      @active_accounts = create_list(:account, 2)
      @pending_accounts = create_list(:pending_account, 3)
    end

    it "should return only active accounts" do
      expect(Account.active).to match_array(@active_accounts)
    end
  end
end
