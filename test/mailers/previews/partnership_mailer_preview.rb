# Preview all emails at http://localhost:3000/rails/mailers/partnership_mailer
class PartnershipMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/partnership_mailer/creation_notification
  def creation_notification_business
    partnership = Partnership.first
    PartnershipMailer.creation_notification_business(partnership)
  end

  def creation_notification_charity
    partnership = Partnership.first
    PartnershipMailer.creation_notification_charity(partnership)
  end

end
