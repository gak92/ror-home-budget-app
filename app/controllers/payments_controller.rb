class PaymentsController < ApplicationController
  def new
    @category = current_user.categories.find(params[:category_id])
    @categories = current_user.categories.all
    @payment = current_user.payments.new
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @new_payment = current_user.payments.new(payment_params)

    render :new unless @new_payment.save
    redirect_to category_path(@category.id)
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end
