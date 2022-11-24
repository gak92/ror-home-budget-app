require 'rails_helper'

RSpec.describe Payment, type: :model do
  before :each do
    @new_user = User.new(name: 'testing', email: 'testing@test.com', password: 1_234_567,
                         password_confirmation: 1_234_567)
    @new_user.save
    @new_category = Category.new(name: 'Grocery', icon: 'https://grocery.com/grocery.jpg', author_id: @new_user.id)
    @new_category.save
    @payment = Payment.new(name: 'Milk', amount: '2.5', author_id: @new_user.id, category_id: @new_category.id)
  end

  it 'payment should be valid' do
    expect(@payment).to be_valid
  end

  it 'Should not be validate if name is nil' do
    @payment.name = nil
    expect(@payment).to_not be_valid
  end

  it 'Should not be validate if amount is nil' do
    @payment.amount = nil
    expect(@payment).to_not be_valid
  end
end
