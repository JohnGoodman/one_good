class CreateNeedCategories < ActiveRecord::Migration
  def change
    create_table :need_categories do |t|
      t.references :need, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
