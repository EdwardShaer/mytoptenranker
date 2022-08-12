class ApplicationMailer < ActionMailer::Base
  default from: "from@mytop10.com"

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to MyTop10! Please activate your account.")
  end
end
