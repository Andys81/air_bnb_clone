class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :column.name
      t.string :column.description
      t.string :column.address
      t.string :column.city
      t.string :column.country

      t.timestamps null: false
    end
  end
end
