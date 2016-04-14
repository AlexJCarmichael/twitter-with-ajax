class CreateDanes < ActiveRecord::Migration
  def change
    create_table :danes do |t|
      t.string :body, limit: 140, null: false
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
