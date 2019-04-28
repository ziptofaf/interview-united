# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

root = Category.create(name: 'Root')


price_filter = CategoryFilter.create(name: 'price', type: 'CategoryFilters::DecimalFilter')
fuel_filter = CategoryFilter.create(name: 'fuel', type: 'CategoryFilters::DictionaryFilter')
year_filter = CategoryFilter.create(name: 'year', type: 'CategoryFilters::IntegerFilter')
main_ing_filter = CategoryFilter.create(name: 'main_ingredient', type: 'CategoryFilters::StringFilter')
rotten_filter = CategoryFilter.create(name: 'rotten', type: 'CategoryFilters::BooleanFilter')

DictionaryFilterValue.create([
                               { category_filter: fuel_filter, name: 'Petrol' },
                               { category_filter: fuel_filter, name: 'Gas' }
                             ])
root.category_filters.push(price_filter)

food = Category.create(name: 'Food', parent: root)
food.category_filters.push(rotten_filter)
food.category_filters.push(main_ing_filter)

cars = Category.create(name: 'Cars', parent: root)
cars.category_filters.push(year_filter)

tesla = Category.create(name: 'Tesla', parent: cars)

volvo = Category.create(name: 'Volvo', parent: cars)
volvo.category_filters.push(fuel_filter)

tesla_product = Product.create(name: 'Model S', category: tesla)

volvo_product_1 = Product.create(name: 'C30', category: volvo)
volvo_product_2 = Product.create(name: 'S40', category: volvo)

sandwich = Product.create(name: 'Sandwich', category: food)

sandwich.product_attributes.find_by(category_filter: rotten_filter).tap { |p| p.value = true }.save
sandwich.product_attributes.find_by(category_filter: main_ing_filter).tap { |p| p.value = 'Ham' }.save
sandwich.product_attributes.find_by(category_filter: price_filter).tap { |p| p.value = 2.99 }.save

tesla_product.product_attributes.find_by(category_filter: price_filter).tap { |p| p.value = 200_000 }.save
tesla_product.product_attributes.find_by(category_filter: year_filter).tap { |p| p.value = 2018 }.save

volvo_product_1.product_attributes.find_by(category_filter: price_filter).tap { |p| p.value = 200_000 }.save
volvo_product_1.product_attributes.find_by(category_filter: year_filter).tap { |p| p.value = 2018 }.save
volvo_product_1.product_attributes.find_by(category_filter: fuel_filter).tap { |p| p.value = 'Petrol' }.save

volvo_product_2.product_attributes.find_by(category_filter: price_filter).tap { |p| p.value = 200_000 }.save
volvo_product_2.product_attributes.find_by(category_filter: year_filter).tap { |p| p.value = 2018 }.save
volvo_product_2.product_attributes.find_by(category_filter: fuel_filter).tap { |p| p.value = 'Gas' }.save


