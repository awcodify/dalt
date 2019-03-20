module Dalt
  # Parser is used to parse the date and will return alternate text if failed
  class Parser
    attr_accessor :date, :alternate

    def initialize(date_string, alt: nil)
      @date = nil
      @date_string = date_string
      @alternate = alt
    end

    def parse
      @date = Date.parse(@date_string)
    rescue StandardError
      raise ::Dalt::Error::WithoutAlternate if alternate.nil?

      alternate
    end
  end
end
