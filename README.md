# foreman\_column\_view

A small plugin to showcase the awesome [Deface](https://github.com/spree/deface)
library. It simply adds a column to the Hosts list or properties table. It also
serves as a simple example of including a new Helper in the plugin.

# Installation

Require the gem in Foreman (you may need extra dependencies such as libxml or libxslt
to build the nokogiri dependency)

```yaml
gem 'foreman_column_view'
```

Update Foreman with the new gems:

    bundle update foreman_column_view

# Configuration

By default the plugin will display the Domain associated by each host. This is not
massively useful. To set your own choice of column, add this to Foreman's plugin config file
`foreman_column_view.yaml`. For package based installs this should be in
`/etc/foreman/plugins/foreman_column_view.yaml`. For source installs this should be in
`config/settings.plugins.d` within your install directory.

```yaml
:column_view:
  :name1:
    :title: Shortname1
    :after: last_report
    :content: shortname1
  :name2:
    :title: Shortname2
    :after: name1
    :content: facts_hash['shortname2']
```

`title` is an arbitrary string which is displayed as the column header. `content` is
a method call to the `Host` object, using `host.send`. In these examples `facts_hash`
and `params` are method calls to `Host` returning hash values.

```yaml
:column_view:
  :architecture:
    :title: Architecture
    :after: last_report
    :content: facts_hash['architecture']
  :uptime:
    :title: Uptime
    :after: architecture
    :content: facts_hash['uptime']
  :color:
    :title: Color
    :after: last_report
    :content: params['favorite_color']

```

Additional rows can also be added to the Properties table on the host page by setting
`:view: :hosts_properties`.  The position is also controlled by `:after` using either a
numeric index to represent the row or the name of the previous row (however this will
not work well when the Foreman language is switched).  An example configuration:

```yaml
:column_view:
  :uptime:
    :title: Uptime
    :after: 6
    :content: facts_hash['uptime']
    :view: :hosts_properties
```

If you need to add information not readily available in a host, you can add information that
will be evaluated on runtime by adding `:eval_content: true` to your additional row.
Also, some times you do not want to show the additional row if a certain condition is not met,
in order to show that row conditionally, add `:conditional: :condition_symbol` to your configuration,
and that conditional will be executed on your host.

As an example, the following yaml shows a link to a custom URL if the method host.bmc_available? is true.

```yaml
  :console:
    :title: Console
    :after: 0
    :content: link_to(_("Console"), "https://#{host.interfaces.first.name}.domainname", { :class => "btn btn-info" } )
    :conditional: :bmc_available?
    :eval_content: true
    :view: :hosts_properties
```

If your conditional method needs arguments to work, the arguments should go after the method name separated by
spaces, as in `:custom_method arg1 arg2`


You will need to restart Foreman for changes to take effect, as the `settings.yaml` is
only read at startup.

# TODO

* Add plugin settings to the Settings UI
* Make the column sortable
* Support adding data to other pages

# Copyright

Copyright (c) 2013 Greg Sutcliffe

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
