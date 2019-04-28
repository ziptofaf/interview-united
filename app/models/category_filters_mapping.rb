class CategoryFiltersMapping < ApplicationRecord
  belongs_to :category
  belongs_to :category_filter

  after_create :build_down_the_category_tree
  after_destroy :destroy_down_the_category_tree

  attr_accessor :skip_tree_lookup

  private

  def build_down_the_category_tree
    # this avoids repeating same operation recursively for every descendant of a given node
    return if skip_tree_lookup

    category.all_children.each do |child|
      mapping = CategoryFiltersMapping.new
      mapping.skip_tree_lookup = true
      mapping.category_id = child.id
      mapping.category_filter_id = category_filter_id
      mapping.save!
    end
    # updates products belonging to given category tree accordingly adding and deleting attributes along the way

    category.products.each(&:save)
    category.all_children.each do |child|
      child.products.each(&:save)
    end
  end

  def destroy_down_the_category_tree
    return if skip_tree_lookup

    category.all_children.each do |child|
      mapping = CategoryFiltersMapping.find_by(category_id: child.id, category_filter_id: category_filter_id)
      next unless mapping

      mapping.skip_tree_lookup = true
      mapping.destroy!
    end
    # updates products belonging to given category tree accordingly adding and deleting attributes along the way

    category.products.each(&:save)
    category.all_children.each do |child|
      child.products.each(&:save)
    end
  end
end