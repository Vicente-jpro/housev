require 'rails_helper'

RSpec.describe "lands/new", type: :view do
  before(:each) do
    assign(:land, Land.new(
      title_land: "MyString",
      photo: nil,
      description: "MyString",
      price: 1,
      dimention: nil,
      address: nil
    ))
  end

  it "renders new land form" do
    render

    assert_select "form[action=?][method=?]", lands_path, "post" do

      assert_select "input[name=?]", "land[title_land]"

      assert_select "input[name=?]", "land[photo]"

      assert_select "input[name=?]", "land[description]"

      assert_select "input[name=?]", "land[price]"

      assert_select "input[name=?]", "land[dimention_id]"

      assert_select "input[name=?]", "land[address_id]"
    end
  end
end
