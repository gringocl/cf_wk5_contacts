class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :person, index: true
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
