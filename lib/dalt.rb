require 'date'
require 'dalt/error/without_alternate'
require 'dalt/parser'
require 'dalt/version'

# Dalt will use instance of Dalt::Parser
module Dalt
  def self.parse(text, alt: nil)
    @date = Dalt::Parser.new(text, alt: alt).parse
  end
end
