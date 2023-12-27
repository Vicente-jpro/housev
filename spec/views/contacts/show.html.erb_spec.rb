require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    assign(:contact, Contact.create!(
      cliente_name: "Cliente Name",
      whatsapp: "Whatsapp",
      email_cliente: "Email Cliente",
      message: "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cliente Name/)
    expect(rendered).to match(/Whatsapp/)
    expect(rendered).to match(/Email Cliente/)
    expect(rendered).to match(/Message/)
  end
end
