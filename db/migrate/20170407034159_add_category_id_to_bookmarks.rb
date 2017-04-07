class AddCategoryIdToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :category_id, :integer
  end
end
