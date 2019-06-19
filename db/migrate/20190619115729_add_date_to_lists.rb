class AddDateToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :date_due, :date, default: Time.now
  end
end
