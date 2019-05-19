class SessionsController < ApplicationController
  def new
    render layout: "admin"
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = t('sessions.success')
  		log_in(user)
  		redirect_to root_path
  	else
  		flash.now[:error] = t('sessions.error')
  		render :new
  	end
  end

  def destroy
  	log_out
 		flash[:success] = t('sessions.logout_confirmation')
  	redirect_to root_path
  end
end
