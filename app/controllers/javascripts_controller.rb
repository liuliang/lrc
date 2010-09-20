class JavascriptsController < ApplicationController

  def search_article
    @sub_categories = SubCategory.find(:all,:include=>[:category])
  end
end
