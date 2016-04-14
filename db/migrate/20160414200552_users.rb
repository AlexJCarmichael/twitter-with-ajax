class Users < ActiveRecord::Migration
  def change
    rename_table :users, :danes
  end
end
