class AddPurposeToLists < ActiveRecord::Migration[5.2]
  def change
  	add_column :lists, :purpose, :intger, default: 0
  end
end
