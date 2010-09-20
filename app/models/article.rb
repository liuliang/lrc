class Article < ActiveRecord::Base

  belongs_to :category
  belongs_to :sub_category
  belongs_to :user

  validates_presence_of :title,:content,:category_id,:sub_category_id,:user_id

  named_scope :publised ,:conditions=>['is_publised = 1']

  def self.per_page
    20
  end

end
