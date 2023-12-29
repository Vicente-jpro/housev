require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  let(:contact) {
    Contact.create!(
      cliente_name: "MyString",
      whatsapp: "MyString",
      email_cliente: "MyString",
      message: "MyString"
    )
  }

  before(:each) do
    assign(:contact, contact)
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(contact), "post" do

      assert_select "input[name=?]", "contact[cliente_name]"

      assert_select "input[name=?]", "contact[whatsapp]"

      assert_select "input[name=?]", "contact[email_cliente]"

      assert_select "input[name=?]", "contact[message]"
    end
  end
end
