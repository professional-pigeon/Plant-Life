class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :photo, presence: true
  validates :name, presence: true
  # scope :user, (param)-> { where('(user_id) like ?', "#{param}")}
  def wait_time
    if self.category == 'Tree' || self.category == 'Fruit'
      time = Time.now.to_i + (86400 * 3)
      self.water_time = Time.strptime(time.to_s, '%s')
    elsif self.category == 'Vegetable' || self.category == 'Herb'
      time = Time.now.to_i + (86400 * 4)
      self.water_time = Time.strptime(time.to_s, '%s')
    else
      time = Time.now.to_i + (86400 * 5)
      self.water_time = Time.strptime(time.to_s, '%s')
    end
  end

  def start_time
    self.water_time
  end

  def health_to_num
    n = 0
    if self.health == "Excellent"
      n = 5
    elsif self.health == "Good"
      n = 4
    elsif self.health == "Okay"
      n = 3
    elsif self.health == "Bad"
      n = 2
    else
      n = 1
    end
    return n
  end


end
