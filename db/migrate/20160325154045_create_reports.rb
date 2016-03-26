class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :reports
  end
end
