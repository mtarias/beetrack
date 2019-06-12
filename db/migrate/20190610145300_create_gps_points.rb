class CreateGpsPoints < ActiveRecord::Migration
  def change
    create_table :gps_points do |t|
      t.float :latitude
      t.float :longitude
      t.string :sent_at
      t.belongs_to :vehicle, index: true

      t.timestamps null: false
    end
  end
end
