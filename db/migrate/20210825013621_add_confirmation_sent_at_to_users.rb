class AddConfirmationSentAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmation_sent_at, :datetime
  end
end
