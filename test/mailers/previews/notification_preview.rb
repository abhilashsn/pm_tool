# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/completed_task
  def completed_task
    Notification.completed_task
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification/incompleted_task
  def incompleted_task
    Notification.incompleted_task
  end

end
