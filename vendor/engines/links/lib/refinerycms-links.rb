require 'refinerycms-base'

module Refinery
  module Links
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "links"
          plugin.activity = {
            :class => Link
          }
        end
      end
    end
  end
end
require File.expand_path('../refinerycms-link_categories', __FILE__)