class UserMailer < ApplicationMailer
  default from: "notification@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notice.subject
  #
  def notice(user)
    @user = user
    @greeting = "Your movie has been reviewed."

    mail(to: @user.email, subject: "New Review Posted")
  end
end
