require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        name_profile: "Name Profile",
        phone1: "Phone1",
        phone2: "Phone2",
        profile_type: "Profile Type",
        user: nil
      ),
      Profile.create!(
        name_profile: "Name Profile",
        phone1: "Phone1",
        phone2: "Phone2",
        profile_type: "Profile Type",
        user: nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name Profile".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone1".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone2".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Profile Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
