module CategoryFiltersMappingsHelper
  def should_be_destroyable?(mapping)
    category = mapping.category
    parent = category.parent
    return true if parent.nil?

    !parent.category_filters.include?(mapping.category_filter)
  end
end