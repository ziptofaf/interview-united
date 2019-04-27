json.extract! category, :id, :name, :parent_category, :created_at, :updated_at
json.url category_url(category, format: :json)
