class SayController < ApplicationController
  def hello
    @message = "hello world"
    @names  = ["hari","mani","vinod"]

    @clients_count=Client.count 
    @projects_count=Project.count
    @tasks_count=Task.count
    @clients =Client.all
  end
  def goodbye
    @message = "goodbye world"
    @projects=Project.all 
    @tasks=Task.all
  end
  
end
