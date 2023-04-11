class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :address
      t.string :description
      t.string :name
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
