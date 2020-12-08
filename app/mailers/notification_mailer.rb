class NotificationMailer < ApplicationMailer
  def when_tagged
    @user = params[:user]
    # params ==> { key: value }
    mail(to: @user.email)
  end
end
