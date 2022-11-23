require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @new_user = User.new(name: 'testing', email: 'testing@test.com', password: 1234567, password_confirmation: 1234567)
    @new_user.save
    @new_category = Category.new(name: 'Grocery', icon: 'https://grocery.com/grocery.jpg', author_id: @new_user.id)
  end

  # before { subject.save }

  it 'Subject should be valid' do
    expect(@new_category).to be_valid
  end

  it 'Category Name should be present' do
    @new_category.name = nil
    expect(@new_category).to_not be_valid
  end

  it 'Icon link should be present' do
    @new_category.icon = nil
    expect(@new_category).to_not be_valid
  end
end