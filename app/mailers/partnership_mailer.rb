class PartnershipMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.partnership_mailer.creation_notification.subject
  #
  def creation_notification_business(partnership)
    @partnership = partnership
    @business = @partnership.business
    @business_user = User.find(@business.user_ids.first)
    @greeting = "Hi, #{@business.name}!"

    mail(to: @business_user.email, subject: "Your Partnership Request is sent to #{@partnership.mission.charity.name}!")
  end

  def creation_notification_charity(partnership)
    @partnership = partnership
    @charity = @partnership.mission.charity
    @charity_user = User.find(@charity.user_ids.first)
    @greeting = "Hi, #{@charity.name}!"

    mail(to: @charity_user.email, subject: "You received a Partnership Request from #{@partnership.business.name}!")
  end
end
