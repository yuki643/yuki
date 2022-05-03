class AddTotalDateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :total_date, :integer
    add_column :rooms, :total_price, :integer
  end
end
