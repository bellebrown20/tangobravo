class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :airplane, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.float :score

      t.timestamps
    end
  end
end
