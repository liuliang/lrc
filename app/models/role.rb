class Role < ActiveRecord::Base

  has_many :users

  def self.per_page
    20
  end
  
end