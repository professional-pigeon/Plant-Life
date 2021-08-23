class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :photo, presence: true
  # scope :user, (param)-> { where('(user_id) like ?', "#{param}")}
end
