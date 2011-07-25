module NavigationHelpers
  module Refinery
    module Links
      def path_to(page_name)
        case page_name
        when /the list of links/
          admin_links_path

         when /the new link form/
          new_admin_link_path
        when /the list of link_categories/
          admin_link_categories_path

         when /the new link_category form/
          new_admin_link_category_path
        else
          nil
        end
      end
    end
  end
end
