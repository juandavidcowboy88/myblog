require 'test_helper'

class UserNotifierMailerTest < ActionMailer::TestCase
  test "welcome_user" do
    mail = UserNotifierMailer.welcome_user
    assert_equal "Welcome user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_post_mail" do
    mail = UserNotifierMailer.new_post_mail
    assert_equal "New post mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
