require 'spec_helper'

class Hiera
  module Backend
    describe Rspec_backend do

      before(:each) do
        Thread.current[:rspec_hiera_data] = hiera_data if respond_to?(:hiera_data)
      end

      after(:each) do
        Thread.current[:rspec_hiera_data] = nil
      end

      describe '#lookup' do

        let(:hiera_data) do
          {
              'stringval' => 'string',
              'boolval' => true,
              'numericval' => 42,
              'arrayval' => ['one', 'two'],
              'hashval' => {key: 'value'}
          }
        end

        it 'provides a value for a valid key' do
          expect(subject.lookup('stringval', nil, nil, nil, nil)).to eq 'string'
          expect(subject.lookup('boolval', nil, nil, nil, nil)).to eq true
          expect(subject.lookup('numericval', nil, nil, nil, nil)).to eq 42
          expect(subject.lookup('arrayval', nil, nil, nil, nil)).to eq ['one', 'two']
          expect(subject.lookup('hashval', nil, nil, nil, nil)).to eq key: 'value'
        end

        describe 'scoped hiera data' do

          let(:hiera_data) do
            {
                'boolval' => false,
                'numericval' => Math::PI,
            }
          end

          it 'scopes data' do
            expect do
              subject.lookup('stringval', nil, nil, nil, nil)
            end.to raise_error(/:no_such_key/)

            expect(subject.lookup('boolval', nil, nil, nil, nil)).to eq false
            expect(subject.lookup('numericval', nil, nil, nil, nil)).to eq Math::PI
          end
        end
      end
    end
  end
end
