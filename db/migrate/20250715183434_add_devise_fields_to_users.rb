class AddDeviseFieldsToUsers < ActiveRecord::Migration[7.0] # adjust for your Rails version
  def change
    change_table :users do |t|
      ## Required by Devise
      t.string :encrypted_password, null: false, default: ""

      ## Optional Devise modules
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      # Add indexes
      t.index :reset_password_token, unique: true
    end
  end
end
