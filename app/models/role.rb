class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  def self.per_page
    20
  end
  
end