class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = @user.categories
  end

  def show
    @user = current_user
    @category = @user.categories.find(params[:id])
    @payments = @category.payments.order('created_at DESC')
  end

  def new
    @user = current_user
    @category = @user.categories.new
  end

  def create
    @user = current_user
    @new_category = @user.categories.new(category_params)

    render :new unless @new_category.save

    redirect_to categories_path
  end
  
  private

  def category_params
    params.require(:categories).permit(:name, :icon, :author_id)
  end

end
