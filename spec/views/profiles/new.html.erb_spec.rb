require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      name_profile: "MyString",
      phone1: "MyString",
      phone2: "MyString",
      profile_type: "MyString",
      user: nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[name_profile]"

      assert_select "input[name=?]", "profile[phone1]"

      assert_select "input[name=?]", "profile[phone2]"

      assert_select "input[name=?]", "profile[profile_type]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
