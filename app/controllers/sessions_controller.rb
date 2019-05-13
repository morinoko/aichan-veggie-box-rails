class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = t('sessions.success')
  		# login in and render root
  	else
  		flash.now[:error] = t('sessions.error')
  		render :new
  	end
  end

  def destroy
  end
end
