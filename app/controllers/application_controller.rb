class ApplicationController < ActionController::Base
    helper_method :confirm_logged_in, :current_user
      
    def current_user
        @current_user ||=User.find(session[:user_id]) if session[:user_id] 
    end
     

    def confirm_logged_in
        unless session[:user_id]
          flash[:notice] = "Please log in."
          #redirect_to(access_login_path)
          # redirect_to prevents requested action from running
        end
      end

end
