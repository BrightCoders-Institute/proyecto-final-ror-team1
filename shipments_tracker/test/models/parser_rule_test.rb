require "test_helper"

class ParserRuleTest < ActiveSupport::TestCase
  def setup
    @parser_rule = ParserRule.new(
      code: '567',
      description: 'Anything',
      carrier_id: 5,
      internal_code: 'code123'
    )
  end

  test 'code should be present' do
    @parser_rule.code = ''
    assert_not @parser_rule.valid?
  end

  test 'description should be present' do
    @parser_rule.description = ''
    assert_not @parser_rule.valid?
  end

  test 'carrier_id should be present' do
    @parser_rule.carrier_id = nil
    assert_not @parser_rule.valid?
  end

  test 'internal_code should be present' do
    @parser_rule.internal_code = ''
    assert_not @parser_rule.valid?
  end
end
