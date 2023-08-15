require 'rails_helper'

RSpec.describe "houses/show", type: :view do
  before(:each) do
    assign(:house, House.create!(
      room: 2,
      title: 3,
      living_room: 4,
      bath_room: 5,
      yeard: 6,
      kitchen: 7,
      balcony: 8,
      condition: "Condition",
      type_negotiation: "Type Negotiation",
      price: 9,
      garage: 10,
      pool: 11,
      discription: "Discription",
      tipology: "Tipology",
      next_by: "Next By",
      furnished: false,
      property_type: "Property Type",
      location: nil,
      address: nil,
      dimention: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/Condition/)
    expect(rendered).to match(/Type Negotiation/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/Discription/)
    expect(rendered).to match(/Tipology/)
    expect(rendered).to match(/Next By/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Property Type/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
