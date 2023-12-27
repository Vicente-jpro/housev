require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      cliente_name: "MyString",
      whatsapp: "MyString",
      email_cliente: "MyString",
      message: "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[cliente_name]"

      assert_select "input[name=?]", "contact[whatsapp]"

      assert_select "input[name=?]", "contact[email_cliente]"

      assert_select "input[name=?]", "contact[message]"
    end
  end
end
