# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '34ad42ebcf847505f2f7aa6af0f20abd'  # uncomment secret if not using cookies
  
  # filter_parameter_logging :password

end
