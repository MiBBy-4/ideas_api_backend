class RenameBusinessmenColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :businessmen, :users
  end
end
