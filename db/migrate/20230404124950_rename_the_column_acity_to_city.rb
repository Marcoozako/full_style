class RenameTheColumnAcityToCity < ActiveRecord::Migration[7.0]
  def change
    remove_column :flats, :acity
    add_column :flats, :city, :string
  end
end
