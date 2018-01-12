class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.float :rating
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :distance

      t.timestamps
    end
  end
end
