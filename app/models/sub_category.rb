class SubCategory < ActiveRecord::Base

  has_many :articles
  belongs_to :category

  validates_presence_of :name,:category_id
  validates_uniqueness_of :name

end
