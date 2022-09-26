class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :prop_name
      t.string :prop_type
      t.integer :room
      t.bigint :sqft
      t.bigint :hsptl_dist
      t.bigint :amount
      t.string :address
      t.string :attachment
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
