module Vagrant
  module Notify
    class Config < Vagrant.plugin(2, :config)
      attr_accessor :enable

      def initialize()
        @enable = UNSET_VALUE
      end

      def validate(machine)
        errors = _detected_errors
        if @enable != 0
          if @enable != false && @enable != true
            errors << "Unknown option: #{@enable}"

            { "notify" => errors }
          end
        end
      end

      def finalize!
        @enable = 0 if @enable == UNSET_VALUE
      end
    end
  end
end
