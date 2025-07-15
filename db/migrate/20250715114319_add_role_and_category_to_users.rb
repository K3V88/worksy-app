class AddRoleAndCategoryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :string
    add_column :users, :category, :string
    add_column :users, :custom_category, :string
  end
end
