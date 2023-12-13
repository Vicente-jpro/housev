require 'rails_helper'

RSpec.describe "plans_selecteds/show", type: :view do
  before(:each) do
    assign(:plans_selected, PlansSelected.create!(
      day_used: 2,
      duration: 3,
      plans: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
