module ArticlesHelper
  def is_on?(on, index)
    on.to_i == index.to_i ? "class='on'" : ""
  end
end
