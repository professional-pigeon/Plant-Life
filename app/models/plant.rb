class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  # scope :user, (param)-> { where('(user_id) like ?', "#{param}")}
end
