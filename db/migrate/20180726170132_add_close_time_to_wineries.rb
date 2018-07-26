class AddCloseTimeToWineries < ActiveRecord::Migration[5.2]
  def change
    add_column :wineries, :close_time, :string
  end
end
