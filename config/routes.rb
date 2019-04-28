Rails.application.routes.draw do
  get 'search/index'
  get 'search/filtered'
  root 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
    get :copy_filters_prompt, on: :member
    post :copy_filters, on: :member
    resources :category_filters_mappings
  end
  resources :category_filters do
    resources :dictionary_filter_values
  end
  # For now they all lead to one place but this approach makes it easier to split them into unique controllers later on
  resources :category_filters_boolean_filters, controller: :category_filters
  resources :category_filters_integer_filters, controller: :category_filters
  resources :category_filters_decimal_filters, controller: :category_filters
  resources :category_filters_string_filters, controller: :category_filters
  resources :category_filters_dictionary_filters, controller: :category_filters

  resources :products do
    resources :product_attributes, only: [:index, :edit, :update]
    resources :product_attributes_boolean_attributes, controller: :product_attributes
    resources :product_attributes_integer_attributes, controller: :product_attributes
    resources :product_attributes_decimal_attributes, controller: :product_attributes
    resources :product_attributes_string_attributes, controller: :product_attributes
    resources :product_attributes_dictionary_attributes, controller: :product_attributes
  end
end
