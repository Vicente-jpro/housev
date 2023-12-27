require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        cliente_name: "Cliente Name",
        whatsapp: "Whatsapp",
        email_cliente: "Email Cliente",
        message: "Message"
      ),
      Contact.create!(
        cliente_name: "Cliente Name",
        whatsapp: "Whatsapp",
        email_cliente: "Email Cliente",
        message: "Message"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Cliente Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Whatsapp".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email Cliente".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Message".to_s), count: 2
  end
end
