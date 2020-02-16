class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tenders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates_presence_of :first_name,:last_name 
	after_create:send_mail
  def send_mail
    UserMailer.with(user:self).welcome_email.deliver_later!
  end
  def first
		self.first_name
   end
  def last
  	self.last_name
  end
end
