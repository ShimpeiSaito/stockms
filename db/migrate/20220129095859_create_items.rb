class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :amount, null: false
      t.integer :minimum, null: false
      t.string :category, null: false
      t.text :remarks
      t.integer :status, default: 1
  
      t.timestamps
    end
  end
end
