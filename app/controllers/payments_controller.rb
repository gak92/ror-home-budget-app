class PaymentsController < ApplicationController

  def new
    @user = current_user
    @params = params
    @category = @user.categories.find(params[:category_id])
    @payment = @user.payments.new
  end

  def create
    @user = current_user
    @category = @user.categories.find(params[:category_id])
    @new_payment = @user.payments.new(name: params[:payment][:name], amount: params[:payment][:amount], category_id: params[:category_id])

    render :new unless @new_payment.save
    redirect_to category_path(@category.id)
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end

end
