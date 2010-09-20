class Category < ActiveRecord::Base

  has_many :articles
  has_many :sub_categories

  validates_presence_of :name
  validates_uniqueness_of :name

  def per_page
    20
  end

end
