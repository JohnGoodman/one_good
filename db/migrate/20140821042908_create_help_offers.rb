class CreateHelpOffers < ActiveRecord::Migration
  def change
    create_table :help_offers do |t|
      t.references :need, index: true
      t.references :user, index: true
      t.integer :receiving_user_id, index: true
      t.string :status
      t.text :decline_message
      t.text :accept_message

      t.timestamps
    end
  end
end
