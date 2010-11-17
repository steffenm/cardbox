class DeleteIndexFromUsers < ActiveRecord::Migration
  def self.up
    remove_index(:users, :index_users_on_email)
  end

  def self.down
  end
end
