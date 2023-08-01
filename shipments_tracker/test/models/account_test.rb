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

    test "should validate uniqueness of id" do
      account1 = Account.create(company_name: "Company 1", active: true)
      account2 = Account.new(company_name: "Company 2", active: false, id: account1.id)

      assert_not account2.valid?, "Account id is not unique"
    end
end
