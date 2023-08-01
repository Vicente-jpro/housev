require 'rails_helper'

RSpec.describe "lands/index", type: :view do
  before(:each) do
    assign(:lands, [
      Land.create!(
        title_land: "Title Land",
        photo: nil,
        description: "Description",
        price: 2,
        dimention: nil,
        address: nil
      ),
      Land.create!(
        title_land: "Title Land",
        photo: nil,
        description: "Description",
        price: 2,
        dimention: nil,
        address: nil
      )
    ])
  end

  it "renders a list of lands" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title Land".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
