module ForemanColumnView
  module HostsHelper

    def fcv_title
      title = SETTINGS[:column_view][:title] || 'Domain' rescue 'Domain'
      return title
    end 

    def fcv_content(host)
      content = SETTINGS[:column_view][:content] || 'domain' rescue 'domain'
      if content =~ /(.*)\[(.*)\]/
        return host.send($1)[$2.gsub(/['"]/,'')]
      else
        return host.send(content)
      end
    end 

  end
end
