class Setting::ColumnView < ::Setting

  def self.load_defaults
    # Check the table exists
    return unless super

    Setting.transaction do
      [
        self.set('column_view', "Hash of columns to display",
                  { :architecture =>
                    { :title => 'Architecture',
                      :after => 'last_report',
                      :content => "facts_hash['architecture']"
                    }
                  }
                )
      ].compact.each { |s| self.create s.update(:category => "Setting::ColumnView")}
    end

    true

  end

end
