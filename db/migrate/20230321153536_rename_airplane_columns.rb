class RenameAirplaneColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column(:airplanes, :class, :engines)
    rename_column(:airplanes, :model, :make)
  end
end
