class AddPhotoToWineries < ActiveRecord::Migration[5.2]
  def change
    add_column :wineries, :photo, :string
  end
end
