require 'deface'
require 'foreman_column_view'

module ForemanColumnView
  #Inherit from the Rails module of the parent app (Foreman), not the plugin.
  #Thus, inhereits from ::Rails::Engine and not from Rails::Engine
  class Engine < ::Rails::Engine

    # Load this before the Foreman config initizializers, so that the Setting.descendants
    # list includes the plugin STI setting class
    initializer 'foreman_column_view.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path("../../../app/models/setting/column_view.rb", __FILE__)
    end

    initializer 'foreman_column_view.helper' do |app|
      ActionView::Base.send :include, ForemanColumnView::HostsHelper
    end

  end
end
