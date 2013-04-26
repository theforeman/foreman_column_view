if Setting[:column_view]
  Setting[:column_view].keys.sort.map do |k|
    after = Setting[:column_view][k.to_sym][:after]
    Deface::Override.new(
      :virtual_path => "hosts/_list",
      :name => "content_#{k}",
      :insert_after => "td:contains('#{after}')",
      :text => "\n    <td class=\"hidden-tablet hidden-phone\"><%= fcv_content host, '#{k}' %></td>"
    )
  end
end
