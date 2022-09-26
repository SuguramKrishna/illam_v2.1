class PropertiesController < ApplicationController
 

  def list
    @property  = Property.new
    render 'properties/adding'
  end

  def adding
    if current_user.role=="Owner"
      @property  = Property.new
      render 'properties/adding'
    else
      render "/pages/role"
    end
    # p "==================================================="
    # p "==================================================="
    # p "==================================================="
    # puts current_user.role
  end

  def adding_property
    @properties = Property.new(prop_params)
    @properties.user_id = current_user.id
    if @properties.save
      redirect_to "/properties/listing"
    else
      render 'properties/adding'
    end

  end



  private
  
  def prop_params
    params.require(:property).permit(:prop_name, :prop_type, :room, :sqft, :hsptl_dist, :amount, :address)
  end
end
