class AddClienttypeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :clienttype, :string
  end
end
