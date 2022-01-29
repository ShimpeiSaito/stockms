class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
