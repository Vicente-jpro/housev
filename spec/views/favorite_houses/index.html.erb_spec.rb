require 'rails_helper'

RSpec.describe "favorite_houses/index", type: :view do
  before(:each) do
    assign(:favorite_houses, [
      FavoriteHouse.create!(
        profile: nil,
        house: nil
      ),
      FavoriteHouse.create!(
        profile: nil,
        house: nil
      )
    ])
  end

  it "renders a list of favorite_houses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
