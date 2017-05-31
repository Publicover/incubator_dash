class RemindersController < ApplicationController
  
  def write_email
  end

  def send_email
    StudentMailer.view_single(params[:address]).deliver_now
  end
end
