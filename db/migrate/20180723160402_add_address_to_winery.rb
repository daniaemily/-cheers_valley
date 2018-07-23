class AddAddressToWinery < ActiveRecord::Migration[5.2]
  def change
    add_column :wineries, :address, :string
  end
end
