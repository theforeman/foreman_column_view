if Setting[:column_view]
  Setting[:column_view].keys.sort.map do |k|
    after = Setting[:column_view][k.to_sym][:after]
    Deface::Override.new(
      :virtual_path => "hosts/_list",
      :name => "title_#{k}",
      :insert_after => "th:contains('#{after}')",
      :text => "\n    <th class=\"hidden-tablet hidden-phone\"><%= fcv_title '#{k}' %></th>"
    )
  end
end
