module ForemanColumnView
  module HostsHelper

    def fcv_title(column)
      title = Setting[:column_view][column.to_sym][:title]
      return title
    end 

    def fcv_content(host, column)
      content = Setting[:column_view][column.to_sym][:content]
      if content =~ /(.*)\[(.*)\]/
        return host.send($1)[$2.gsub(/['"]/,'')]
      else
        return host.send(content)
      end
    end 

  end
end
