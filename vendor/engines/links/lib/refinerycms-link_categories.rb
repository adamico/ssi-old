require 'refinerycms-base'

module Refinery
  module LinkCategories
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "link_categories"
          plugin.activity = {
            :class => LinkCategory
          }
        end
      end
    end
  end
end
