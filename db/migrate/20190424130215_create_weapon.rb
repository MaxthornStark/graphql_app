class CreateWeapon < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string "uuid"
      t.string "name"
      t.integer "attack"
      t.boolean "legendary", default: false
      t.datetime "created_at"
    end
  end
end
