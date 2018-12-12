class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Hi there, you are almost ready! Remember to update your organisation profile!"
    mail(to: @user.email, subject: "Welcome to Apoyo Community!")
  end
end

