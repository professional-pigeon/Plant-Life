class User < ApplicationRecord
  has_many :plants, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  after_create :welcome_send
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
    # redirect_to root_path, flash[:alert] = "Thank you for signing up!"
  end
end
