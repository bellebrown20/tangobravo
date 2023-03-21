class AddPriceToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :price_per_hour, :string
  end
end
