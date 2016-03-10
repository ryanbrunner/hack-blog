class DropUsers < ActiveRecord::Migration
  def change
    drop_table :users do |t|
      t.string   "name"
      t.string   "email"
      t.date     "date_of_birth"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
    end
  end
end
