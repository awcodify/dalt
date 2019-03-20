RSpec.describe Dalt::Parser do
  it 'has a version number' do
    expect(Dalt::VERSION).not_to be nil
  end

  it 'returns date if date is parsable' do
    parse = described_class.new('monday', alt: 'Hello').parse

    expect(parse).to eq(Date.parse('monday'))
    expect(parse.class).to eq Date
  end

  it 'returns alt if date is not parsable' do
    alt = Date.today
    parse = described_class.new('INVALID DATE', alt: alt).parse

    expect(parse).to eq(alt)
  end

  it 'raise error if invalid date without alternet' do
    parser = described_class.new('INVALID DATE')

    expect { parser.parse }.to raise_error ::Dalt::Error::WithoutAlternate
  end
end
