require 'rails_helper'

RSpec.describe User, type: :model do
  new_user = User.new(name: 'testing', email: 'testing@test.com', password: 1_234_567, password_confirmation: 1_234_567)
  subject { new_user }

  before { subject.save }

  it 'Name should not be blank' do
    expect(subject.name).to eq 'testing'
  end

  it 'Subject should be valid' do
    expect(subject).to be_valid
  end

  it 'Subject should not validate if name not present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Subject should not validate if email not present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
