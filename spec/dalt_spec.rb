RSpec.describe Dalt do
  describe '.parse' do
    it 'return date if valid' do
      parse = described_class.parse('monday', alt: 'Hello')
      expect(parse).to eq(Date.parse('monday'))
    end

    it 'return alternate if invalid' do
      parse = described_class.parse('invalid', alt: 'Hello')
      expect(parse).to eq('Hello')
    end
  end

  describe '.smart_change' do
    it 'returns date if no alternate' do
      format = described_class.smart_change('31-01-2012', day: 32, month: 31, year: 2020)

      expect(format).to eq Date.parse '31-12-2020'
    end

    it 'returns alternet if alternate exist' do
      format = described_class.smart_change('31-01-2012',
                                            day: 32,
                                            month: 31,
                                            year: 2020,
                                            alt: 'Alternate date')

      expect(format).to eq 'Alternate date'
    end
  end
end
