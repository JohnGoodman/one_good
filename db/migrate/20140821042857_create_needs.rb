class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.references :user, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
