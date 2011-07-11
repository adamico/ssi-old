module NavigationHelpers
  module Refinery
    module Registrations
      def path_to(page_name)
        case page_name
        when /the list of registrations/
          admin_registrations_path

         when /the new registration form/
          new_admin_registration_path
        when /the list of payments/
          admin_payments_path

         when /the new payment form/
          new_admin_payment_path
        else
          nil
        end
      end
    end
  end
end
