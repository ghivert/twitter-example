class SessionsController < ApplicationController
  def sign_in_form
  end

  def sign_in
    email = params[:login][:email]
    password = params[:login][:password]
    user = User.find_by(email: email)
    ret = user && user.authenticate(password)
    if ret
      session[:user_token] = user.id.to_s
      redirect_to users_path
    else
      redirect_to sign_in_path, notice: 'Wrong credentials'
    end
  end

  def sign_out
    session[:user_token] = nil
    redirect_to users_path
  end

  private

  def sessions_params
    params.require(:login).permit(:email, :password)
  end
end
