module Dalt
  module Error
    # This class will be raised if parser invalid and alternate params is not filled
    class WithoutAlternate < StandardError
      def initialize(msg = 'Invalid Date')
        super
      end
    end
  end
end
