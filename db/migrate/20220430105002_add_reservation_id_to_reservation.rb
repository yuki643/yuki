class AddReservationIdToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :resevations, :resevation, :integer
  end
end
