require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "new_room_added" do
    mail = Notification.new_room_added
    assert_equal "New room added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
