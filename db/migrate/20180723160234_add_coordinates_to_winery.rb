class AddCoordinatesToWinery < ActiveRecord::Migration[5.2]
  def change
    add_column :wineries, :latitude, :float
    add_column :wineries, :longitude, :float
  end
end
