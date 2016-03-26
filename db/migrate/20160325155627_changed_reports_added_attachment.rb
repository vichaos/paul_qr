class ChangedReportsAddedAttachment < ActiveRecord::Migration
  def self.up
    add_column :reports, :attachment, :string
  end
  
  def self.down
    remove_column :reports, :attachment
  end
end
