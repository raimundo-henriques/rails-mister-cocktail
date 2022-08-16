class RemovePictureFromCocktails < ActiveRecord::Migration[6.1]
  def change
    remove_column :cocktails, :picture, :string
  end
end
