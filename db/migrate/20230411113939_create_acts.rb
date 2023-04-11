class CreateActs < ActiveRecord::Migration[7.0]
  def change
    create_table :acts do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
