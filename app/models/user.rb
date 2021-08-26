class User < ApplicationRecord
  has_many :plants, dependent: :destroy
  has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
    
  after_create :welcome_send
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
    # redirect_to root_path, flash[:alert] = "Thank you for signing up!"
  end


  def plant_tracking
    plants = self.plants
    ticker = 0
    plants.each do |plant|
      if plant.water_time < Time.now
        ticker += 1
      end
    end
    return {:user_name => self.username, :dead_plants => ticker}
  end

  def healthy_plant
    plants = self.plants
    avg_health = 0
    tdis = 0
    tbad = 0
    tokay = 0
    tgood = 0
    texc = 0
    plants.each do |plant|
      if plant.health == "Excellent"
        avg_health += 20
        texc += 1
      elsif plant.health == "Good"
        avg_health += 10
        tgood += 1
      elsif plant.health == "Okay"
        avg_health += 5
        tokay += 1
      elsif plant.health == "Bad"
        avg_health -= 5
        tbad += 1
      else plant.health == "Dismal"
        avg_health -= 10
        tdis += 1
      end
    end
    if avg_health > 0
      avg_health = avg_health / plants.length
    else
      avg_health = 0
    end
    return {:user_name => self.username, :avg_health => avg_health, :dismal => tdis, :bad => tbad, :okay => tokay, :good => tgood, :excellent => texc}
  end

  def self.worst_users
    @users = self.all
    big_array = []
    @users.each do |user|
      big_array.push(user.plant_tracking)
    end
    return big_array.sort_by { |hash| -hash[:dead_plants]}
  end

  def self.best_users
    @users = self.all
    big_array = []
    @users.each do |user|
      big_array.push(user.plant_tracking)
    end
    return big_array.sort_by { |hash| hash[:dead_plants]}
  end

  def self.healthiest
    @users = self.all
    big_array = []
    @users.each do |user|
      big_array.push(user.healthy_plant)
    end
    return big_array.sort_by { |hash| -hash[:avg_health]}
  end

end
