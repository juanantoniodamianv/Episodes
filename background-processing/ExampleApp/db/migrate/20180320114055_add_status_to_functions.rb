class AddStatusToFunctions < ActiveRecord::Migration[5.0]
  def change
  	if column_exists?(:functions, :status)
  		remove_column :functions, :status, :boolean
		end
		add_column :functions, :status, :string, default: 'active'
  end
end
