module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	def logged_in?
		!!current_user
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def require_login
		unless logged_in?
			flash[:error] = t('sessions.login_required')
			redirect_to root_path
		end
	end

	def sessions_page?
		controller_name == "sessions" && (action_name == "new" || action_name = "create")
	end
end
