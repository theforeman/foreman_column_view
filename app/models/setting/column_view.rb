class Setting::ColumnView < ::Setting

  def self.load_defaults
    # Check the table exists
    return unless super

    Setting.transaction do
      [
        self.set('column_title', "Title to display on the new column", "Domain" ),
        self.set('column_content', "Method to send to @host for the column content", "domain" ),
      ].compact.each { |s| self.create s.update(:category => "Setting::ColumnView")}
    end

    true

  end

end
