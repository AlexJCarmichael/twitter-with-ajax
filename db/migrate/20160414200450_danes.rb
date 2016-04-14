class Danes < ActiveRecord::Migration
  def change
    rename_table :danes, :viveks
  end
end
