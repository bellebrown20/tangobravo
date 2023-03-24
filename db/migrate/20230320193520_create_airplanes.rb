class CreateAirplanes < ActiveRecord::Migration[7.0]
  def change
    create_table :airplanes do |t|
      t.string :model
      t.string :class
      t.string :tailnumber
      t.string :home_airport
      t.integer :minimum_hours
      t.string :required_licenses
      t.references :user, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
