class RemindersController < ApplicationController

  def write_email
  end

  def send_email
    StudentMailer.say_hi(params[:address]).deliver_now
  end
end
