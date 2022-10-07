class PropertiesController < ApplicationController


 def new 
  @properties = Property.new
 end

  # rendering the Property Adding Form 
  def list
    @property  = Property.new
    render 'properties/adding'
  end

  # checking whether the user has signed-in with the Owner Role and
  # rendering the result according to it
  def adding
    if current_user.role=="Owner"
      @property  = Property.new
      @props = Property.where(user_id: current_user.id)
      render 'properties/adding'
    else
      render "/pages/role"
    end
  end

  # adding the property data in the table properties and
  # and storing the user_id from the current user id
  def create
    @property  = Property.new
    @properties = Property.new(prop_params)
    @properties.user_id = current_user.id
    if @properties.save
      redirect_to "/properties/my_property"
    else
      render 'properties/adding'
    end
  end


  # rendering the property which is added only by the user
  def my_prop
    @property  = Property.new
    @props = Property.where(user_id: current_user.id)
    render 'properties/my_property'
  end

  # deleting the property with the help of id from the params
  def delete_prop
    @delete = Property.find(params[:id])
    if @delete.destroy
    redirect_to root_path
    end
  end


  #showing the cofirmation message by listing the details 
  #using the params to get the id from the url
  def booking_confirmation
    id = params[:id]
    get_id = Property.find(id)
    $details = get_id
    puts $details.id
    redirect_to '/properties/booking'
  end

  #Using to show the search the properties with address, amount, prop_name
  def search_prop
    @search_prop = Property.where('address Like ? OR amount Like ? OR prop_name Like?', "%" + params[:query] + "%", "%" + params[:query] + "%", "%" + params[:query] + "%")
  end

  private
  
  def prop_params
    params.require(:property).permit(:prop_name, :prop_type, :room, :sqft, :hsptl_dist, :amount, :address)
  end
end
