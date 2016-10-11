class UserMailer < ApplicationMailer
  default from: "cinephile.launch@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notice.subject
  #
  def notice(review)
    @review = review
    @greeting = "Your movie has been reviewed."

    mail(
    to: review.movie.user.email,
    subject: "New review posted for #{review.movie.title}"
    )
  end
end
