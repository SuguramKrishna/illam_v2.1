class PropertiesController < ApplicationController
 

  def list
    @property  = Property.new
    render 'properties/adding'
  end


  def adding
    if current_user.role=="Owner"
      @property  = Property.new
      @props = Property.where(user_id: current_user.id)
      render 'properties/adding'
    else
      render "/pages/role"
    end
  end

  def adding_property
    @properties = Property.new(prop_params)
    @properties.user_id = current_user.id
    if @properties.save
      redirect_to "/properties/my_property"
    else
      render 'properties/adding'
    end
  end


  def my_prop
    @property  = Property.new
    @props = Property.where(user_id: current_user.id)
    render 'properties/my_property'
  end

  def delete_prop
    @delete = Property.find(params[:id])
    if @delete.destroy
    redirect_to root_path
    end
  end


  def booking_confirmation
    id = params[:id]
    get_id = Property.find(id)
    $details = get_id
    puts $details.id
    redirect_to '/properties/booking'
  end


  private
  
  def prop_params
    params.require(:property).permit(:prop_name, :prop_type, :room, :sqft, :hsptl_dist, :amount, :address)
  end
end
