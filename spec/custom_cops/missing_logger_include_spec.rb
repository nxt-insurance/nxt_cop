# frozen_string_literal: true

require_relative '../../custom_cops/nxt_core/rails/missing_logger_include.rb'

RSpec.describe CustomCops::NxtCore::Rails::MissingLoggerInclude do
  let(:config) do
    RuboCop::Config.new({ described_class.badge.to_s => { 'Enabled' => true } })
  end
  let(:cop) { described_class.new(config) }
  let(:commissioner) { RuboCop::Cop::Commissioner.new([cop], [], {raise_error: true, autocorrect: true}) }

  subject(:report) { commissioner.investigate(cop.parse(source)) }

  let(:offenses) { report.offenses }
  let(:corrector) { report.offenses.first.corrector }

  context 'when logger is used without include' do
    context 'in a regular class with no other includes' do
      let(:source) do
        <<~RUBY
          module Things
            class ThingService
              def call
                logger.info('Heyy')
              end
            end
          end
        RUBY
      end

      it 'registers an offence' do
        expect(offenses.first.message).to eq(described_class::MSG)
        expect(corrector).to eq(nil) # No correction if the class does not have existing includes
      end
    end

    context 'in a regular class with other includes' do
      let(:source) do
        <<~RUBY
          class ThingService < Thing
            include OtherThing 
            
            def call
              logger.warn('Heyy')
            end
          end
        RUBY
      end

      let(:corrected) do
        <<~RUBY
          class ThingService < Thing
            include Nxt::Loggable
          include OtherThing 
            
            def call
              logger.warn('Heyy')
            end
          end
        RUBY
      end

      it 'registers an offence' do
        expect(offenses.first.message).to eq(described_class::MSG)
        expect(corrector.process).to eq(corrected)
      end
    end

    context 'in a MaintenanceTask' do
      let(:source) do
        <<~RUBY
          class Task1 < MaintenanceTasks::Task
            def call
              logger.info('Heyy')
            end
          end

          class Task2 < ::MaintenanceTasks::Task
            def call = logger.error('Heyy')
          end
        RUBY
      end

      it 'does not register an offence' do
        expect(offenses).to be_empty
      end
    end

    context 'in a controller' do
      let(:source) do
        <<~RUBY
          class ThingController
            def call
              logger.info('Heyy')
            end
          end
        RUBY
      end

      it 'does not register an offence' do
        expect(offenses).to be_empty
      end
    end
  end

  context 'when Nxt::Loggable is included' do
    let(:source) do
      <<~RUBY
        class ThingService
          include Nxt::Loggable

          def call
            logger.info('Heyy')
          end
        end
      RUBY
    end

    it 'does not register an offence' do
      expect(offenses).to be_empty
    end
  end

  context 'when NxtCore::Logging::Loggable is included' do
    let(:source) do
      <<~RUBY
        class ThingService
          include NxtCore::Logging::Loggable

          def call
            logger.info('Heyy')
          end
        end
      RUBY
    end

    it 'does not register an offence' do
      expect(offenses).to be_empty
    end
  end
end
