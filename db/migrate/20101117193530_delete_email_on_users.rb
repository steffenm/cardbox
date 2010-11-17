class DeleteEmailOnUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :email    
  end

  def self.down
  end
end
