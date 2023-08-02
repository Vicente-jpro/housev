require 'rails_helper'

RSpec.describe "lands/edit", type: :view do
  let(:land) {
    Land.create!(
      title_land: "MyString",
      photo: nil,
      description: "MyString",
      price: 1,
      dimention: nil,
      address: nil
    )
  }

  before(:each) do
    assign(:land, land)
  end

  it "renders the edit land form" do
    render

    assert_select "form[action=?][method=?]", land_path(land), "post" do

      assert_select "input[name=?]", "land[title_land]"

      assert_select "input[name=?]", "land[photo]"

      assert_select "input[name=?]", "land[description]"

      assert_select "input[name=?]", "land[price]"

      assert_select "input[name=?]", "land[dimention_id]"

      assert_select "input[name=?]", "land[address_id]"
    end
  end
end
