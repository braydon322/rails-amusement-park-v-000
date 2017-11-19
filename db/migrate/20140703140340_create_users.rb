class CreateUsers < ActiveRecord::Migration
  create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :happiness
      t.integer :nausea
      t.integer :height
      t.integer :tickets
      t.boolean :admin, default: false
      t.timestamps
    end
end
