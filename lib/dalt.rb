require 'dalt/version'
require 'date'

module Dalt
  def self.parse(text)
    @date = Date.parse(text)
    self
  rescue StandardError
    @date = nil
    self
  end

  def self.alt(alt)
    return alt if @date.nil?

    @date
  end
end
