class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # POST /contacts or /contacts.json

  def show 
  end 

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save

        if contact_params[:controlleer_name] == "houses"
          house = House.new 
          house.id = contact_params[:house_id]
          owner_house = User.find_user_by_house(house)
      
          HouseMailer.publisher(
            contact_params[:cliente_name], 
            contact_params[:email_cliente],  
            contact_params[:message], 
            contact_params[:whatsapp], 
            owner_house, 
            house)
                .deliver_later
          
        elsif contact_params[:controlleer_name] == "lands"

          land = Land.new 
          land.id = contact_params[:land_id]
          owner_land = User.find_user_by_land(land)
      
          LandMailer.publisher(
            contact_params[:cliente_name], 
            contact_params[:email_cliente],  
            contact_params[:message],  
            contact_params[:whatsapp], 
            owner_land, 
            land)
                .deliver_later
        end

        format.html { redirect_to contact_url(@contact), notice:  t("controllers.contact") }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(
        :cliente_name, 
        :whatsapp, 
        :email_cliente, 
        :message,
        :house_id,
        :land_id,
        :controlleer_name)
    end
end
