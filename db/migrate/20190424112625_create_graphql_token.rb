class CreateGraphqlToken < ActiveRecord::Migration[5.2]
  def change
    create_table :graphql_tokens do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.date "last_access"
      t.string "key", null: false
      t.datetime "expiration_date"
    end
  end
end
