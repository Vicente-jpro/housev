module BelongsAnotherUserMessageConcerns
    extend ActiveSupport::Concern
    
    def belongs_another_user_message(format, house, object_name)
      format.html { redirect_to house_url(house), info: "This #{object_name} belongs to another user." }
      format.json { render json: ["This #{object_name} belongs to another user. Impossible delete"], status: :unprocessable_entity }
    end

end