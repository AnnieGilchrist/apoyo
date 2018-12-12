require 'test_helper'

class PartnershipMailerTest < ActionMailer::TestCase
  test "creation_notification" do
    mail = PartnershipMailer.creation_notification
    assert_equal "Creation notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
