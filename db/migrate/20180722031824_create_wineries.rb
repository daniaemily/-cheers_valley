class CreateWineries < ActiveRecord::Migration[5.2]
  def change
    create_table :wineries do |t|
      t.string :name
      t.time :open_hours
      t.boolean :tours

      t.timestamps
    end
  end
end
