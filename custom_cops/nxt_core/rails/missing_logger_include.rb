# frozen_string_literal: true

module CustomCops
  module NxtCore
    module Rails
      # The NxtCore logger requires an include in most cases. Ensures it is present.
      #
      # @safety
      #   This cop's autocorrection is unsafe because
      #   `logger` may refer to an instance variable or other method of the class.
      class MissingLoggerInclude < RuboCop::Cop::Base
        extend RuboCop::Cop::AutoCorrector

        RESTRICT_ON_SEND = [:logger].freeze

        MSG = 'Missing `include Nxt::Loggable` for a class which uses the logger.'

        # NodePattern docs: https://github.com/rubocop/rubocop-ast/blob/master/docs/modules/ROOT/pages/node_pattern.adoc
        def_node_matcher :includes_nxt_loggable?, <<~PATTERN
          (begin <(send nil? :include (const (const nil? :Nxt) :Loggable)) ...>)
        PATTERN

        def on_send(node)
          return unless node.receiver.nil?

          class_node = node.ancestors.find(&:class_type?)
          return unless class_node

          class_definition_node = class_node.each_child_node(:begin).first
          return if includes_nxt_loggable?(class_definition_node)

          add_offense(class_node, message: MSG) do |corrector|
            corrector.insert_before(class_definition_node.child_nodes.first, "include Nxt::Loggable\n")
          end
        end
      end
    end
  end
end
