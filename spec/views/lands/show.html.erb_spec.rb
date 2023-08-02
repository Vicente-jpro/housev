require 'rails_helper'

RSpec.describe "lands/show", type: :view do
  before(:each) do
    assign(:land, Land.create!(
      title_land: "Title Land",
      photo: nil,
      description: "Description",
      price: 2,
      dimention: nil,
      address: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title Land/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
