class AddPictureToCocktails < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :picture, :string
  end
end
