class AddPublicationPeriodFieldInIdeasTable < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :publication_period, :date
  end
end
