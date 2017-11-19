class CreateAttractions < ActiveRecord::Migration
  create_table :attractions do |t|
      t.string :name
      t.integer :min_height
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :tickets
      t.timestamps
    end
end
