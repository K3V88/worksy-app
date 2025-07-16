class AddDetailsToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :image, :string
    add_column :jobs, :location, :string
    add_column :jobs, :hourly_price, :decimal
    add_column :jobs, :price_per_m2, :decimal
  end
end
