require 'rails_helper'

RSpec.describe "houses/index", type: :view do
  before(:each) do
    assign(:houses, [
      House.create!(
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
      ),
      House.create!(
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
      )
    ])
  end

  it "renders a list of houses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(7.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(8.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Condition".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type Negotiation".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(9.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(10.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(11.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Discription".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Tipology".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Next By".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Property Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
