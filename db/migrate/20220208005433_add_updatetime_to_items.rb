class AddUpdatetimeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :update_time, :datetime, default: Time.now
  end
end
