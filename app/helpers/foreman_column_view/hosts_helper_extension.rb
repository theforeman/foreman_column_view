module ForemanColumnView
  module HostsHelperExtension
    def self.included(base)
      base.send :alias_method_chain, :overview_fields, :fcv
    end

    # Extend core HostsHelper to add rows to Properties on hosts/show
    def overview_fields_with_fcv host
      fields = overview_fields_without_fcv(host)
      return fields unless SETTINGS[:column_view]

      valid_views = [:hosts_properties]
      SETTINGS[:column_view].reject { |k,v| !valid_views.include?(v[:view]) }.keys.sort.map do |k|
        after       = SETTINGS[:column_view][k.to_sym][:after]
        conditional = SETTINGS[:column_view][k.to_sym][:conditional]
        if conditional.present?
          method = conditional[0].to_sym
          args   = conditional.drop(1)
        end

        begin
          next unless (conditional.present? && host.respond_to?(method) && host.send(method, *args)) ||
                      (conditional.nil?)
        rescue ArgumentError
          Rails.logger.warn("Foreman_column_view: Your are supplying the wrong kind/number of arguments to your conditional method. Host #{host} , method - #{method} - arguments - #{args.join(', ')} ")
          next
        end

        # This won't work well with i18n, use row numbers instead
        after = fields.find_index { |r| r[0].include? after } unless after.is_a? Fixnum
        eval_content = SETTINGS[:column_view][k.to_sym][:eval_content]
        content = eval_content ? eval(SETTINGS[:column_view][k.to_sym][:content]) :
                                 fcv_content(host, k)

        fields.insert(after || -1, [fcv_title(k), content])
      end

      fields
    end
  end
end
