# Preview all emails at http://localhost:3000/rails/mailers/user_notifier_mailer
class UserNotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier_mailer/welcome_user
  def welcome_user
    UserNotifierMailer.welcome_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier_mailer/new_post_mail
  def new_post_mail
    UserNotifierMailer.new_post_mail
  end

end
