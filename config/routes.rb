Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :category_filters_mappings
  end
  resources :category_filters
  # For now they all lead to one place but this approach makes it easier to split them into unique controllers later on
  resources :category_filters_boolean_filters, controller: :category_filters
  resources :category_filters_integer_filters, controller: :category_filters
  resources :category_filters_decimal_filters, controller: :category_filters
  resources :category_filters_string_filters, controller: :category_filters
  resources :category_filters_dictionary_filters, controller: :category_filters

  resources :products do
    resources :product_attributes
  end
end
