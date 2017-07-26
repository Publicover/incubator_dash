require "rails_helper"

RSpec.describe ResetMailer do

  before do
    student = Student.create(name: "jill", email: "jill@jill.com",
      password: "password", flavor: "student", admin_id: 1)
  end

  describe "sending it" do
    let(:mail) { described_class.password_reset(student).deliver_now }
    let(:student) { Student.create(name: "jill", email: "jill@jill.com",
      id: 1, password_reset_token: "sendthisrightawayplease") }
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
  # describe "password_reset" do
  #   let(:mail) { ResetMailer.password_reset }
  #
  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Password reset")
  #     expect(mail.to).to eq(["to@example.org"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end
  #
  #   it "renders the body" do
  #     expect(mail.body.encoded).to match("Hi")
  #   end
  # end

end
