require 'rails_helper'

RSpec.describe "favorite_houses/show", type: :view do
  before(:each) do
    assign(:favorite_house, FavoriteHouse.create!(
      profile: nil,
      house: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
