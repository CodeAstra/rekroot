require 'test_helper'

class ApplicantsMailerTest < ActionMailer::TestCase
  test "apply_to" do
    mail = ApplicantsMailer.apply_to
    assert_equal "Apply to", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "applied_to" do
    mail = ApplicantsMailer.applied_to
    assert_equal "Applied to", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
