class SessionsController < ApplicationController

  def create
    if auth = request.env['omniauth.auth']
      user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = User.find_by(email: params[:email])
      user[:user_id] = user.id
      reirect_to root_path
    end

  end
end
