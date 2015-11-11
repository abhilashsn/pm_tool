class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_project
  
 # def current_project
  #	@project = session[:project].nill? ? Project.first : Project.find(session[:project])
 #end



 rescue_from CanCan::AccessDenied do
 redirect_to dashboard_index_path, notice: "You are not authorized to access"
end
end
