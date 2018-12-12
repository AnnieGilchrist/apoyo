class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @organisation = @user.organisation.name
    @greeting = "Hi, #{@organisation}!"

    mail(to: @user.email, subject: "Welcome to Apoyo Community!")
  end
end
