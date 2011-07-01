require 'refinerycms-base'

module Refinery
  module Schools
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "schools"
          plugin.activity = {
            :class => School
          }
        end
      end
    end
  end
end
require File.expand_path('../refinerycms-events', __FILE__)