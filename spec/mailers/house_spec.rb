require "rails_helper"

RSpec.describe HouseMailer, type: :mailer do
  describe "publisher" do
    let(:mail) { HouseMailer.publisher }

    it "renders the headers" do
      expect(mail.subject).to eq("Publisher")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
