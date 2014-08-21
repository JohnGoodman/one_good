class CreateHelpOffers < ActiveRecord::Migration
  def change
    create_table :help_offers do |t|
      t.references :user, index: true
      t.string :receiving_user_id
      t.string :status
      t.text :decline_message
      t.text :accept_message

      t.timestamps
    end
  end
end
