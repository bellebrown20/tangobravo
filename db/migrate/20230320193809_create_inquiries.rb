class CreateInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :inquiries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :airplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
