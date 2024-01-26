# frozen_string_literal: true

module CustomCops
  module NxtCore
    module Rails
      # Ensures that the NxtCore logger is used instead of `Rails.logger`.
      class UseOfRailsLogger < RuboCop::Cop::Base
        extend RuboCop::Cop::AutoCorrector

        RESTRICT_ON_SEND = [:logger].freeze

        MSG = 'Use of Rails.logger is not allowed. Use `logger` and include `Nxt::Loggable`'

        def on_send(node)
          return unless node.receiver&.const_type? && node.receiver.short_name == :Rails

          add_offense(node, message: MSG) do |corrector|
            corrected = node.source.gsub('Rails.logger', 'logger')
            corrector.replace(node, corrected)
          end
        end
      end
    end
  end
end
