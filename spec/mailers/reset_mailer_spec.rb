require "rails_helper"

RSpec.describe ResetMailer do

  before do
    user = User.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", course_name: "GBO INC")
  end

  describe "sending it" do
    let(:mail) { described_class.password_reset(user).deliver_now }
    let(:user) { User.create(name: "jill", email: "jill@jill.com",
      id: 1, course_name: "GBO INC", password_reset_token: "sendthisrightawayplease") }
    let(:address) { ["jill@jill.com"] }

    it "has a subject" do
      expect(mail.subject).to eq("dash creative Password Reset")
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
