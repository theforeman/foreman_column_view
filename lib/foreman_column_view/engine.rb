require 'foreman_column_view'
require 'deface'

module ForemanColumnView
  #Inherit from the Rails module of the parent app (Foreman), not the plugin.
  #Thus, inhereits from ::Rails::Engine and not from Rails::Engine
  class Engine < ::Rails::Engine

    initializer 'foreman_column_view.helper' do |app|
      ActionView::Base.send :include, ForemanColumnView::HostsHelper
    end

  end
end
