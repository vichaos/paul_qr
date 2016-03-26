class ChangedUsersAddedCryptedPasswordNamesSaltAndIndexedRoleId < ActiveRecord::Migration
  def self.up
    add_column :users, :crypted_password, :string
    add_column :users, :names, :string
    add_column :users, :salt, :string
    add_index :users, :role_id
  end
  
  def self.down
    remove_column :users, :crypted_password
    remove_column :users, :names
    remove_column :users, :salt
  end
end
