module ForemanColumnView
  module HostsHelperExtension
    def self.included(base)
      base.send :alias_method_chain, :overview_fields, :fcv
    end

    # Extend core HostsHelper to add rows to Properties on hosts/show
    def overview_fields_with_fcv host
      fields = overview_fields_without_fcv(host)

      SETTINGS[:column_view].reject { |k,v| v[:view] != 'hosts_properties' }.keys.sort.map do |k|
        after = SETTINGS[:column_view][k.to_sym][:after]
        if after.is_a? Fixnum
          after_index = after
        else
          # This won't work well with i18n, use row numbers instead
          after_index = fields.find_index { |r| r[0].include? after }
        end
        fields.insert(after_index || -1, [fcv_title(k), fcv_content(host, k)])
      end

      fields
    end
  end
end
