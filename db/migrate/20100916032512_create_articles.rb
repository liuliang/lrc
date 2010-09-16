class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title,:default=>nil
      t.string :short_title,:default=>nil
      t.text :content
      t.integer :category_id
      t.integer :user_id
      t.integer :sub_category_id
      t.string :remark,:default=>nil
      t.integer :weight,:default=>0,:limit=>1
      t.integer :view,:default=>0
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
