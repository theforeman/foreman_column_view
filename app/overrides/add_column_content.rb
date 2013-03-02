Deface::Override.new(:virtual_path => "hosts/_list", 
                     :name => "add_column_content",
                     :insert_after => "td:contains('report')",
                     :text => "\n      <td class=\"hidden-tablet hidden-phone\"><%= fcv_content host %></td>")
