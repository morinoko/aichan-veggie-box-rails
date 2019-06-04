require 'net/http'

class ApplicationController < ActionController::Base
	include SessionsHelper
	before_action :set_locale

	RECAPTCHA_MINIMUM_SCORE = 0.5

	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options
		{ locale: I18n.locale }
	end

	def verify_recaptcha?(token, recaptcha_action)
    secret_key = Rails.application.credentials.dig(:recaptcha_secret_key)

    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json['success'] && json['score'] > RECAPTCHA_MINIMUM_SCORE && json['action'] == recaptcha_action
  end
end
