require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'product_valid' do
    product = Product.new
    product.title = "TestValid"
    product.description = "smthng here"
    product.price = 3.26
    product.left_on_warehouse = 20
    assert product.valid?, true
  end
  test 'product_invalid' do
    product = Product.new
    product.title = "TestInvalid"
    product.description = "smthng here"
    product.price = -5.0
    product.left_on_warehouse = -6
    assert product.invalid?, true
  end
end
