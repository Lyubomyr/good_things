class UserMailer < ApplicationMailer

  def request_created(user, request)
    @user = user
    @request = request
    mail(to: @user.email, subject: "Your request created.")
  end
end
