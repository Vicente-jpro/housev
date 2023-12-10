require 'rails_helper'

RSpec.describe "plans/show", type: :view do
  before(:each) do
    assign(:plan, Plan.create!(
      name_plans: "Name Plans",
      price: 2,
      description: "MyText",
      activated: false,
      first_time: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name Plans/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
