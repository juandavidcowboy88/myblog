# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  bloger                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [ :facebook ]

   enum role: [ :admin ,  :blogger ]
# tener en cuenta esta función define estatus  con relación al
#enum creado  (:blogger or admin )
  before_create :set_default_role
  after_create :send_welcome_email

    def set_default_role
      self.role = :blogger
   end

   def send_welcome_email
    UserNotifierMailer.welcome_user(self).deliver_now
   end

   def self.from_omniauth(auth)
      where(provider: auth.provider, iud: auth.iud).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]

        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!



      end
    end
end
