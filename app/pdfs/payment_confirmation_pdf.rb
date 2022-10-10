class PaymentConfirmationPdf < Prawn::Document
    def initialize(payment_details)
        super()
        @payments = payment_details
        check_payment
    end

    def check_payment
        # # if $details
        #     @property_detail = Property.find_by(user_id:$details["id"])
        #     @user_detail = User.find( $details["user_id"])
        #         text "You have Successfully completed the payment of ₹"
        #         $details.amount
        #         text "for the property" 
                # $details.prop_name 
                # text "please contact to"
                #   @user_detail.name 
                # text "at" 
                # @user_detail.email 
                # text "or"
                #  @user_detail.phone_number 
                # text "for more details."
        # end

        table payment_table
    end

    def payment_table
           [["Card Holder Name", "Property Name", "Amount", "Property Owner Email"]]  +
              @payments.map do |prop|
              @property = Property.find_by(id:prop.properties_id)
              [prop.card_holder_name ,@property.prop_name, @property.amount ,User.find_by(id: @property.user_id).email]
              end

    end


end 