class AddStatusAtToCardCardboxes < ActiveRecord::Migration
  def self.up
    add_column :card_cardboxes, :status_at, :timestamp
  end

  def self.down
    remove_column :card_cardboxes, :status_at
  end
end
