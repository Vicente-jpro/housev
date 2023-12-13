require 'rails_helper'

RSpec.describe "plans_selecteds/edit", type: :view do
  let(:plans_selected) {
    PlansSelected.create!(
      day_used: 1,
      duration: 1,
      plans: nil,
      user: nil
    )
  }

  before(:each) do
    assign(:plans_selected, plans_selected)
  end

  it "renders the edit plans_selected form" do
    render

    assert_select "form[action=?][method=?]", plans_selected_path(plans_selected), "post" do

      assert_select "input[name=?]", "plans_selected[day_used]"

      assert_select "input[name=?]", "plans_selected[duration]"

      assert_select "input[name=?]", "plans_selected[plans_id]"

      assert_select "input[name=?]", "plans_selected[user_id]"
    end
  end
end
