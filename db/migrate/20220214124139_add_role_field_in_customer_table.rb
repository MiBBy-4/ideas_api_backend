class AddRoleFieldInCustomerTable < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :role, :integer, default: 0
  end
end
