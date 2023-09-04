class CreateActsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :acts_users, id: false do |t|
      t.belongs_to :act
      t.belongs_to :user
      t.timestamps
    end
  end
end
