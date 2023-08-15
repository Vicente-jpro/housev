require 'rails_helper'

RSpec.describe "houses/new", type: :view do
  before(:each) do
    assign(:house, House.new(
      room: 1,
      title: 1,
      living_room: 1,
      bath_room: 1,
      yeard: 1,
      kitchen: 1,
      balcony: 1,
      condition: "MyString",
      type_negotiation: "MyString",
      price: 1,
      garage: 1,
      pool: 1,
      discription: "MyString",
      tipology: "MyString",
      next_by: "MyString",
      furnished: false,
      property_type: "MyString",
      location: nil,
      address: nil,
      dimention: nil
    ))
  end

  it "renders new house form" do
    render

    assert_select "form[action=?][method=?]", houses_path, "post" do

      assert_select "input[name=?]", "house[room]"

      assert_select "input[name=?]", "house[title]"

      assert_select "input[name=?]", "house[living_room]"

      assert_select "input[name=?]", "house[bath_room]"

      assert_select "input[name=?]", "house[yeard]"

      assert_select "input[name=?]", "house[kitchen]"

      assert_select "input[name=?]", "house[balcony]"

      assert_select "input[name=?]", "house[condition]"

      assert_select "input[name=?]", "house[type_negotiation]"

      assert_select "input[name=?]", "house[price]"

      assert_select "input[name=?]", "house[garage]"

      assert_select "input[name=?]", "house[pool]"

      assert_select "input[name=?]", "house[discription]"

      assert_select "input[name=?]", "house[tipology]"

      assert_select "input[name=?]", "house[next_by]"

      assert_select "input[name=?]", "house[furnished]"

      assert_select "input[name=?]", "house[property_type]"

      assert_select "input[name=?]", "house[location_id]"

      assert_select "input[name=?]", "house[address_id]"

      assert_select "input[name=?]", "house[dimention_id]"
    end
  end
end
