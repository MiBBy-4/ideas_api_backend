class DeleteUselessFields < ActiveRecord::Migration[6.1]
  def change
    remove_column :ideas, :avg_likes
    remove_column :ideas, :avg_dislikes
  end
end
