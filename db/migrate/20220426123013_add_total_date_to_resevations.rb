class AddTotalDateToResevations < ActiveRecord::Migration[6.1]
  def change
    add_column :resevations, :total_date, :integer
  end
end
