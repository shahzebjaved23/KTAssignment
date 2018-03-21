class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|

    	t.integer :user_id
    	t.integer :truck_id

    	t.datetime :starting
    	t.datetime :ending
    	t.float :distance

		t.timestamps
    end
  end
end
