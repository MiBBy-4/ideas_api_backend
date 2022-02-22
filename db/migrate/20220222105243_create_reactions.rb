class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :idea, null: false, foreign_key: true

      t.timestamps
    end

    add_index :reactions, [:customer_id, :idea_id], unique: true
  end
end
