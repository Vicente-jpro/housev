require 'rails_helper'

RSpec.describe "favorite_lands/index", type: :view do
  before(:each) do
    assign(:favorite_lands, [
      FavoriteLand.create!(
        profile: nil,
        land: nil
      ),
      FavoriteLand.create!(
        profile: nil,
        land: nil
      )
    ])
  end

  it "renders a list of favorite_lands" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
