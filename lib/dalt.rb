require 'date'
require 'dalt/error/without_alternate'
require 'dalt/formatter'
require 'dalt/parser'
require 'dalt/version'

# Dalt will use instance of Dalt::Parser
module Dalt
  def self.parse(date, alt: nil)
    @date = Dalt::Parser.new(date.to_s, alt: alt).parse
  end

  def self.smart_change(date, options)
    Dalt::Formatter.new(date.to_s, options).smart_change
  end
end
