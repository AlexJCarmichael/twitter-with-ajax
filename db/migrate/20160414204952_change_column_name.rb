class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :viveks, :user_id, :dane_id
  end
end
