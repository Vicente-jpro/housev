require 'rails_helper'

RSpec.describe "plans_selecteds/index", type: :view do
  before(:each) do
    assign(:plans_selecteds, [
      PlansSelected.create!(
        day_used: 2,
        duration: 3,
        plans: nil,
        user: nil
      ),
      PlansSelected.create!(
        day_used: 2,
        duration: 3,
        plans: nil,
        user: nil
      )
    ])
  end

  it "renders a list of plans_selecteds" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
