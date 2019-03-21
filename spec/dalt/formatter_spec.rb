RSpec.describe Dalt::Formatter do
  describe '#smart_change' do
    let(:changer) { described_class.new(date, options) }

    context 'changing the month' do
      let(:date) { Date.parse('31-01-2019') }

      context 'change end of the month' do
        let(:options) { { month: 2 } }
        it 'returns end of the month of selected month' do
          expect(changer.smart_change).to eql Date.parse('28-02-2019')
        end
      end

      context 'out of range month' do
        context 'have alternate options' do
          let(:options) { { month: 13, alt: 'Alternate date' } }
          it 'returns alternate' do
            expect(changer.smart_change).to eql 'Alternate date'
          end
        end

        context 'have no alternate options' do
          let(:options) { { month: 13 } }

          it 'return max month' do
            expect(changer.smart_change).to eq Date.parse('31-12-2019')
          end
        end
      end
    end

    context 'changing the day' do
      let(:date) { Date.parse('01-02-2019') }

      context 'day is out of range' do
        context 'have alternate options' do
          let(:options) { { day: 31, alt: 'Alternate date' } }
          it 'returns alternate' do
            expect(changer.smart_change).to eql 'Alternate date'
          end
        end

        context 'have no alternate options' do
          let(:options) { { day: 31 } }

          it 'return last date on that month' do
            expect(changer.smart_change).to eq Date.parse('28-02-2019')
          end
        end
      end

      context 'day is in range' do
        let(:options) { { day: 20, alt: 'Alternate date' } }
        it 'returns the new date' do
          expect(changer.smart_change).to eq Date.parse('20-02-2019')
        end
      end
    end

    context 'change both day and month' do
      let(:date) { Date.parse('01-02-2019') }

      context 'both is out of range' do
        context 'have alternate' do
          let(:options) { { day: 32, month: 13, year: 2020, alt: 'Alternate date' } }
          it 'return the alternate' do
            expect(changer.smart_change).to eq 'Alternate date'
          end
        end

        context 'have no alternate' do
          let(:options) { { day: 32, month: 13, year: 2020 } }
          it 'return max posibility of day and month' do
            expect(changer.smart_change).to eq Date.parse('31-12-2020')
          end
        end
      end
    end
  end
end
