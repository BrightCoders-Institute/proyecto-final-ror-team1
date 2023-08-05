require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "should not save account without company_name" do
    account = Account.new
    assert_not account.save, "Saved the account without a company_name"
  end

  test "should save account with valid attributes" do
    account = Account.new(company_name: "Example Company", active: true)
    assert account.save, "Couldn't save the account with valid attributes"
  end
end
