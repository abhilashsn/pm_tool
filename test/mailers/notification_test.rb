require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "completed_task" do
    mail = Notification.completed_task
    assert_equal "Completed task", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "incompleted_task" do
    mail = Notification.incompleted_task
    assert_equal "Incompleted task", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
