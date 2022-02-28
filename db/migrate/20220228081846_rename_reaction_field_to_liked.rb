class RenameReactionFieldToLiked < ActiveRecord::Migration[6.1]
  def change
    rename_column :reactions, :reaction, :liked
  end
end
