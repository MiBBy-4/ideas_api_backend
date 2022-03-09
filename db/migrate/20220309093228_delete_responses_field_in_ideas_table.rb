class DeleteResponsesFieldInIdeasTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :ideas, :responses
  end
end
