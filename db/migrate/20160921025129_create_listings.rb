class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :city
      t.string :country
      t.decimal :price

      t.timestamps null: false
    end
  end
end
