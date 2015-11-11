class Notification < ApplicationMailer

 
  def completed_task(task)
    @task = task  
    mail to: "#{@task.project.client.email}",
    cc: "abhilashsnmca@gmail.com",
    subject: "#{@task.name} has been completed"
  end

  
  def incompleted_task(task)
   @task = task  
    mail to: "#{@task.project.client.email}",
    cc: "abhilashsnmca@gmail.com",
    subject: "#{@task.name} has been reopened"
  end
end
