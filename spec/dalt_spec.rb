RSpec.describe Dalt do
  it 'return date if valid' do
    parse = described_class.parse('monday', alt: 'Hello')
    expect(parse).to eq(Date.parse('monday'))
  end

  it 'return alternate if invalid' do
    parse = described_class.parse('invalid', alt: 'Hello')
    expect(parse).to eq('Hello')
  end
end
