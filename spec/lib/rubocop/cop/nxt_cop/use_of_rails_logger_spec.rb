# frozen_string_literal: true

require 'rubocop/cop/nxt_cop/use_of_rails_logger'

RSpec.describe Rubocop::Cop::NxtCop::UseOfRailsLogger do
  let(:config) do
    RuboCop::Config.new(
      {
        described_class.badge.to_s => { 'Enabled' => true, 'AutoCorrect' => true, 'SafeAutoCorrect' => true }
      }
    )
  end
  let(:cop) { described_class.new(config) }
  let(:commissioner) { RuboCop::Cop::Commissioner.new([cop], [], { raise_error: true, autocorrect: true }) }

  subject(:report) { commissioner.investigate(cop.parse(source)) }

  let(:offenses) { report.offenses }
  let(:corrector) { report.offenses.first.corrector }

  context 'when Rails.logger is used' do
    let(:source) do
      <<~RUBY
        class ThingService
          def call
            Rails.logger.warn('Hi')
          end
        end
      RUBY
    end

    let(:corrected) do
      <<~RUBY
        class ThingService
          def call
            logger.warn('Hi')
          end
        end
      RUBY
    end

    it 'registers an offence' do
      expect(report.offenses.first.message).to eq(described_class::MSG)
      expect(corrector.process).to eq(corrected)
    end
  end
end
