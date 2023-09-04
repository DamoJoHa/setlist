class CreateActsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :acts_users do |t|
      t.references :act, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
