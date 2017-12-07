# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :address        => "smtp.gmail.com",
  :port           => 587,
  :domain         => "gmail.com",
  :user_name      => "RoyalTra31@gmail.com",
  :password       => "*Royal$0",
  :authentication => :plain
}