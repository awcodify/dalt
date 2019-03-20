module Dalt
  module Error
    class WithoutAlterate < StandardError
      def initialize(msg = 'Invalid Date')
        super
      end
    end
  end
end
