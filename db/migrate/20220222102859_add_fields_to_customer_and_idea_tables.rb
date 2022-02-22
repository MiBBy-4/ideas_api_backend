class AddFieldsToCustomerAndIdeaTables < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :name, :string
    add_column :customers, :surname, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :skype, :string
    add_column :ideas, :avg_likes, :float
    add_column :ideas, :avg_dislikes, :float
  end
end
