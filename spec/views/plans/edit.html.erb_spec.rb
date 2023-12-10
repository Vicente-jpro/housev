require 'rails_helper'

RSpec.describe "plans/edit", type: :view do
  let(:plan) {
    Plan.create!(
      name_plans: "MyString",
      price: 1,
      description: "MyText",
      activated: false,
      first_time: false
    )
  }

  before(:each) do
    assign(:plan, plan)
  end

  it "renders the edit plan form" do
    render

    assert_select "form[action=?][method=?]", plan_path(plan), "post" do

      assert_select "input[name=?]", "plan[name_plans]"

      assert_select "input[name=?]", "plan[price]"

      assert_select "textarea[name=?]", "plan[description]"

      assert_select "input[name=?]", "plan[activated]"

      assert_select "input[name=?]", "plan[first_time]"
    end
  end
end
