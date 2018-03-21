class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|

      t.timestamps
    end
  end
end
