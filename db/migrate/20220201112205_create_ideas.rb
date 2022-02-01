class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.string :problem
      t.string :sphere
      t.string :geo_focus
      t.string :team
      t.string :next_steps
      t.string :investor_requirements
      t.timestamps
    end
  end
end
