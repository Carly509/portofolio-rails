class SessionsController < ApplicationController
  class SessionsController < ApplicationController

    def new
    end
  
    def create
      def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
     
        session[:user_id] = @user.id
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  
    def destroy
      session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
   
  private
  def auth
    request.env['omniauth.auth']
  end
end
