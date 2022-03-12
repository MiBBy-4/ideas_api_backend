class RemovePhoneNumberColumnInCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :phone_number
  end
end
