class RenameResevationColumnToResevations < ActiveRecord::Migration[6.1]
  def change
    rename_column :resevations, :resevation,:resevation_id
  end
end
