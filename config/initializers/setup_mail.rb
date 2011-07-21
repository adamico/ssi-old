ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "asciicasts.com",
  :user_name            => ENV['gmail_auth_user'],
  :password             => ENV['gmail_auth_psw'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
