module ProfilesConcerns
    extend ActiveSupport::Concern
    
    def gender_to_integer(params)
        params[:profile][:gender].to_i
    end

end