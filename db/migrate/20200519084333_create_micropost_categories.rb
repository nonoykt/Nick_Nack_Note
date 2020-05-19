class CreateMicropostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_categories do |t|
      t.references :micropost
      t.references :category

      t.timestamps
    end
  end
end
