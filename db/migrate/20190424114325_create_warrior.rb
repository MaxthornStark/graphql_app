class CreateWarrior < ActiveRecord::Migration[5.2]
  def change
    create_table :warriors do |t|
      t.string "uuid"
      t.string "name"
      t.string "descent"
      t.datetime "created_at"
      t.integer "weapon_id", null: true
    end
  end
end
