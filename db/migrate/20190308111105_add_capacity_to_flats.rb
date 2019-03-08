class AddCapacityToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :capacity, :integer
  end
end
