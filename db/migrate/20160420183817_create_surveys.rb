class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :flight_type
      t.integer :car_share
      t.integer :user_id
      t.integer :flight_miles
      t.integer :car_type
      t.integer :car_miles
      t.string :diet

      t.timestamps

    end
  end
end
