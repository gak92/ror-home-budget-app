class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    return unless user_signed_in?
    @categories = current_user.categories
  end

  def show
    @category = current_user.categories.find(params[:id])
    @payments = @category.payments.order('created_at DESC')
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @new_category = current_user.categories.new(category_params)

    render :new unless @new_category.save
    redirect_to categories_path
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])
    render :edit unless @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:categories).permit(:name, :icon, :author_id)
  end
end
