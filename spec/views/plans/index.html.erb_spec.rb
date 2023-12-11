require 'rails_helper'

RSpec.describe "plans/index", type: :view do
  before(:each) do
    assign(:plans, [
      Plan.create!(
        name_plans: "Name Plans",
        price: 2,
        description: "MyText",
        activated: false,
        first_time: false
      ),
      Plan.create!(
        name_plans: "Name Plans",
        price: 2,
        description: "MyText",
        activated: false,
        first_time: false
      )
    ])
  end

  it "renders a list of plans" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name Plans".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
