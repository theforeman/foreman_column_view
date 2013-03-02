module ForemanColumnView
  if defined?(Rails) && Rails::VERSION::MAJOR == 3
    require 'foreman_column_view/engine'
  end
end
