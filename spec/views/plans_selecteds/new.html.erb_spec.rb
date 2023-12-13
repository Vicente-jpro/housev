require 'rails_helper'

RSpec.describe "plans_selecteds/new", type: :view do
  before(:each) do
    assign(:plans_selected, PlansSelected.new(
      day_used: 1,
      duration: 1,
      plans: nil,
      user: nil
    ))
  end

  it "renders new plans_selected form" do
    render

    assert_select "form[action=?][method=?]", plans_selecteds_path, "post" do

      assert_select "input[name=?]", "plans_selected[day_used]"

      assert_select "input[name=?]", "plans_selected[duration]"

      assert_select "input[name=?]", "plans_selected[plans_id]"

      assert_select "input[name=?]", "plans_selected[user_id]"
    end
  end
end
