# foreman\_column\_view

A small plugin to showcase the awesome [Deface](https://github.com/spree/deface)
library. It simply adds a column to the Hosts list. It also serves as a simple example
of including a new Helper in the plugin.

# Installation

Require the gem in Foreman, and also Deface, in `bundler.d/Gemfile.local.rb`:

```yaml
gem 'foreman_column_view', :git => "https://github.com/GregSutcliffe/foreman_column_view.git"
```

Update Foreman with the new gems:

    bundle update

# Configuration

By default the plugin will display the Domain associated by each host. This is not
massively useful. To set your own choice of column, add this to Foreman's config file

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
a method call to the `Host` object, using `host.send`. You can also access `Hash` objects
as well:

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
```

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
