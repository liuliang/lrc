class Article < ActiveRecord::Base

  belongs_to :category
  belongs_to :sub_category

  validates_presence_of :title,:content,:category_id,:sub_category_id,:user_id

end
