class AddPriceToListing < ActiveRecord::Migration
  def change
		add_column :listings, :property_type, :string
		add_column :listings, :accomodates, :integer
		add_column :listings, :bedrooms, :integer
		add_column :listings, :bathrooms, :integer
  end
end
