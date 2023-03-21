class AddStuffToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :license, :string
    add_column :users, :fly_hours, :integer
  end
end
