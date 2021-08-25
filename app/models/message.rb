class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  validates_presence_of :content, :sender_id, :recipient_id
  scope :unread, -> { where read: false }
end
