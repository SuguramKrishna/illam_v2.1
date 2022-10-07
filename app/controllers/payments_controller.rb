class PaymentsController < ApplicationController

  #saving the details of the payment to the db with the user id and property id
  def pay
    @payment = PaymentDetail.new(pay_params)
    @payment.users_id = current_user.id
    if @payment.save
      redirect_to "/payments/payment_confirmation"
    else
      render 'payments/payment'
    end
  end



  private
  
  def pay_params
    params.require(:payment_details).permit(:card_holder_name, :password, :card_number, :card_expiry_month, :card_expiry_year, :properties_id)
  end

end
