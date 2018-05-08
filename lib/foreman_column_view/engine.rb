require 'deface'

module ForemanColumnView
  class Engine < ::Rails::Engine
    engine_name 'foreman_column_view'

    config.autoload_paths += Dir['#{config.root}/app/helpers']
    config.autoload_paths += Dir['#{config.root}/app/overrides']

    initializer 'foreman_column_view.register_plugin', :before => :finisher_hook do |app|
      Foreman::Plugin.register :foreman_column_view do
        requires_foreman '>= 1.17'
      end
    end

    initializer 'foreman_column_view.helper' do |app|
      ActionView::Base.send :include, ForemanColumnView::HostsHelper

      # Extend core HostHelper to add rows to Properties on hosts/show
      ::HostsHelper.send :include, ForemanColumnView::HostsHelperExtension
    end

  end
end
