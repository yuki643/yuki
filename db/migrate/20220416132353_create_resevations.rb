class CreateResevations < ActiveRecord::Migration[6.1]
  def change
    create_table :resevations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :number_people
      t.string :room_name
      t.text :room_introduction
      t.integer :price
      t.integer :total_price
      t.date  :reservation_date
      t.string  :room_image
      t.integer  :user_id
      t.integer  :room_id
      t.timestamps
    end
  end
end
