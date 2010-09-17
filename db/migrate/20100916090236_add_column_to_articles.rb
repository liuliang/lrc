class AddColumnToArticles < ActiveRecord::Migration
  def self.up
   add_column :articles,:is_publised,:boolean,:default=>true
   add_column :articles,:is_verify,:boolean,:default=>false
  end

  def self.down
   remove_column :articles,:is_publised
   remove_column :articles,:is_verify
  end
end
