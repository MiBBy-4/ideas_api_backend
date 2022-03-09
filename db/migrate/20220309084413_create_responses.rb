class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :idea, null: false, foreign_key: true

      t.timestamps
    end

    add_index :responses, [:customer_id, :idea_id], unique: true
  end
end
