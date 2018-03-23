class AddCompanyId < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :company_id, :integer
  	add_column :trips, :company_id, :integer
  	add_column :trucks, :company_id, :integer
  end
end
