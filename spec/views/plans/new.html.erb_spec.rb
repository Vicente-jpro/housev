require 'rails_helper'

RSpec.describe "plans/new", type: :view do
  before(:each) do
    assign(:plan, Plan.new(
      name_plans: "MyString",
      price: 1,
      description: "MyText",
      activated: false,
      first_time: false
    ))
  end

  it "renders new plan form" do
    render

    assert_select "form[action=?][method=?]", plans_path, "post" do

      assert_select "input[name=?]", "plan[name_plans]"

      assert_select "input[name=?]", "plan[price]"

      assert_select "textarea[name=?]", "plan[description]"

      assert_select "input[name=?]", "plan[activated]"

      assert_select "input[name=?]", "plan[first_time]"
    end
  end
end
