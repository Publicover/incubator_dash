require 'rails_helper'

RSpec.describe StudentMailer do

  describe "sending it" do
    let (:address) { ['fake@faker.com'] }
    let(:mail) { described_class.say_hi(address).deliver_now }

    it "has a subject" do
      expect(mail.subject).to eq("#holdmybeer")
    end

    it "has a recipeint" do
      expect(mail.to).to eq(address)
    end

    it "has a sender address" do
      expect(mail.from).to eq(['jim@sprintwithdash.com'])
    end

    it "will send" do
      expect { mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

end
