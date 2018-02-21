require 'Date'

RSpec.describe Dalt do
  it 'has a version number' do
    expect(Dalt::VERSION).not_to be nil
  end

  it 'returns date if date is parsable' do
    parse = Dalt.parse('monday').alt('Hello')

    expect(parse).to eq(Date.parse('monday'))
  end

  it 'returns alt if date is not parsable' do
    alt = Date.today
    parse = Dalt.parse('INVALID DATE').alt(alt)

    expect(parse).to eq(alt)
  end
end
