class RenameCardCardboxStatusToState < ActiveRecord::Migration
  def self.up
    rename_column :card_cardboxes, :status, :state
  end

  def self.down
    rename_column :card_cardboxes, :state, :status
  end
end
