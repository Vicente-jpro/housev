module LandsHelper
    def is_index_page?(page_name)
        !@page.nil? and @page == page_name
    end
end
