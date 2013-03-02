Deface::Override.new(:virtual_path => "hosts/_list", 
                     :name => "add_column_title",
                     :insert_after => "th:contains('report')",
                     :text => "\n    <th class=\"hidden-tablet hidden-phone\"><%= fcv_title %></th>")
