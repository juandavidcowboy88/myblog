class UserNotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier_mailer.welcome_user.subject
  #
  def welcome_user
    @user = user
    @url = 'https://blog-makeit-juan.herokuapp.com/posts'
    
    mail(to: @user.email, subject: 'wilkomme makkereal camp')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier_mailer.new_post_mail.subject
  #
  def new_post_mail
    @user = user
    @post = post

    mail(to: @user.email, subject 'Un nuevo post ha sido creado ')
  end
end
