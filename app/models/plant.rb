class Plant < ApplicationRecord
  belongs_to :user
  # scope :user, (param)-> { where('(user_id) like ?', "#{param}")}
end
