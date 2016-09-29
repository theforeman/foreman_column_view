require 'deface'
require 'foreman_column_view'
require 'deface'

module ForemanColumnView
  #Inherit from the Rails module of the parent app (Foreman), not the plugin.
  #Thus, inhereits from ::Rails::Engine and not from Rails::Engine
  class Engine < ::Rails::Engine

    initializer 'foreman_column_view.register_plugin', :before => :finisher_hook do |app|
      Foreman::Plugin.register :foreman_column_view do
      end if (Rails.env == "development" or defined? Foreman::Plugin)
    end

    initializer 'foreman_column_view.helper' do |app|
      ActionView::Base.send :include, ForemanColumnView::HostsHelper

      # Extend core HostHelper to add rows to Properties on hosts/show
      ::HostsHelper.send :include, ForemanColumnView::HostsHelperExtension
    end

  end
end
