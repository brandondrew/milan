# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '34ad42ebcf847505f2f7aa6af0f20abd'  # uncomment secret if not using cookies
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

#  @sections = Section.find(:all)   
  
  # TODO: replace @sections with sections.... and remove @sections from all the controllers TODO!!!!
  def sections
    @sections ||= Section.find(:all)
  end
  
  def current_section
    @current_section ||= Section.find(params[:id]).name
    ## TODO ##
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id])
    # TODO: implement users
  end
  
  
    
end
