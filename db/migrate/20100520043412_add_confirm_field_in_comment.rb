class AddConfirmFieldInComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :confirm, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :comments, :confirm
  end
end
