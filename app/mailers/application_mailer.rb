class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.admin_email
  layout 'mailer'
end
