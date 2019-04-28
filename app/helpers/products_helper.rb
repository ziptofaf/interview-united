module ProductsHelper
  # returns category name with all parents up to root, eg. "root -> cars -> bmw"
  def category_title_to_root(category)
    current_node = category
    str = +"#{current_node.name}"
    current_node = current_node.parent
    until current_node.nil?
      str = "#{current_node.name} ->" + str
      current_node = current_node.parent
    end
    str
  end

  def end_categories_with_name
    Category.without_children.map { |c| [category_title_to_root(c), c.id] }
  end
end