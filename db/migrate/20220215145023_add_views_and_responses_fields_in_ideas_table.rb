class AddViewsAndResponsesFieldsInIdeasTable < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :views, :integer, default: 0
    add_column :ideas, :responses, :integer, default: 0
  end
end
