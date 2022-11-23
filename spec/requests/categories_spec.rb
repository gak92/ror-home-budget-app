require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @new_user = User.new(name: 'testing', email: 'testing@test.com', password: 1_234_567,
                         password_confirmation: 1_234_567)
    @new_user.save
    @new_category = Category.new(name: 'Grocery', icon: 'https://grocery.com/grocery.jpg', author_id: @new_user.id)
    @new_category.save
    sign_in @new_user
  end

  context 'GET /index : ' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end

    it 'Content should have Categories as text' do
      get categories_path
      expect(response.body).to include('Categories')
    end

    it 'Content should have Add New Category as text' do
      get new_category_path
      expect(response.body).to include('Add New Category')
    end
  end
end
