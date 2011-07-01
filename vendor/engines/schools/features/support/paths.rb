module NavigationHelpers
  module Refinery
    module Schools
      def path_to(page_name)
        case page_name
        when /the list of schools/
          admin_schools_path

         when /the new school form/
          new_admin_school_path
        when /the list of events/
          admin_events_path

         when /the new event form/
          new_admin_event_path
        else
          nil
        end
      end
    end
  end
end
