class RenameRoleToClienttypeInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :role, :clienttype
  end
end
