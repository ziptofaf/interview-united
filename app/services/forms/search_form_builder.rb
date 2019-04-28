module Forms
  class SearchFormBuilder
    extend ActionView::Helpers

    def self.identifier_for_filter(filter)
      "filter_#{filter.id}"
    end

    def self.name_for_filter(filter)
      filter.name
    end

    # transforms something like ProductAttributes::BooleanAttribute to boolean_attribute
    def self.partial_view_name(filter)
      filter.type.split('::')[-1].underscore
    end

    def initialize(filters_params)
      @filters_params = filters_params
      find_connected_category_filters
    end

    def products(unfiltered_products)
      blanks = 0
      unfiltered_products_ids = unfiltered_products.map(&:id)
      partial_matches = []
      @filters_with_values.each do |filter, value|
        blanks += 1 and next if value.blank?

        partial_matches.push(filter.attribute_type.where_value(value).where(category_filter: filter).map(&:product_id))
      end
      return unfiltered_products if blanks == @filters_with_values.length

      Product.where(id: (partial_matches.inject(:&) & unfiltered_products_ids))
    end

    private

    def find_connected_category_filters
      @filters_with_values = []
      regex = /filter_(\d+)/
      @filters_params.each_pair do |key, value|
        match = key.match(regex)
        next unless match

        category_filter = CategoryFilter.find_by(id: match[1].to_i)
        next unless category_filter

        @filters_with_values.push([category_filter, value])
      end
    end
  end
end