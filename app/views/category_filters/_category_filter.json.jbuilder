json.extract! category_filter, :id, :name, :type, :created_at, :updated_at
json.url category_filter_url(category_filter, format: :json)
