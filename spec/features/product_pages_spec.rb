require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add Product'
    fill_in 'Name', :with => 'Scone'
    fill_in 'Cost', :with => '5.00'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product Saved!'
    expect(page).to have_content 'Scone'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    fill_in 'Cost', :with => '5.00'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end

describe "the edit a product process" do
  it "edits an existing product" do
    visit products_path
    click_link 'Add Product'
    fill_in 'Name', :with => 'Scone'
    fill_in 'Cost', :with => '5.00'
    fill_in 'Country of origin', :with =>'USA'
    click_on 'Create Product'

    first(:link, 'Scone').click
    click_on 'Edit Product'
    fill_in 'Name', :with => 'Poptart'
    fill_in 'Cost', :with => '5.50'
    fill_in 'Country of origin', :with => 'Brazil'
    click_on 'Update Product'
    expect(page).to have_content 'Poptart'
    expect(page).to have_content '5.5'
    expect(page).to have_content 'Brazil'

  end
end
