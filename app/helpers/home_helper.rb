module HomeHelper
    def is_controller_profiles?(controller)
      controller.controller_name == "profiles"
    end

    def is_controller_home?(controller)
        controller.controller_name == "home"
    end
end
