class CreateCardCardboxes < ActiveRecord::Migration
  def self.up
    create_table :card_cardboxes do |t|
      t.integer :card_id
      t.integer :cardbox_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :card_cardboxes
  end
end
