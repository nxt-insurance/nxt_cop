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
        # Test at https://nodepattern.herokuapp.com/
        def_node_matcher :includes_nxt_loggable?, <<~PATTERN
          (begin <(send nil? :include (const (const nil? :Nxt) :Loggable)) ...>)
        PATTERN

        def_node_matcher :includes_nxt_core_loggable?, <<~PATTERN
          (begin <(send nil? :include (const (const (const nil? :NxtCore) :Logging) :Loggable)) ...>)
        PATTERN

        def_node_matcher :is_maintenance_task?, <<~PATTERN
          (class
             (const ...) # Class name
             (const (const {nil? | (cbase)} :MaintenanceTasks) :Task) # MaintenanceTasks::Task or ::MaintenanceTasks::Task
          ...)
        PATTERN

        def_node_matcher :is_controller?, <<~PATTERN
          (class
             (const {nil? | (cbase)} /.+Controller/) # Class name ending in "Controller"
          ...)
        PATTERN

        def on_send(node)
          return unless node.receiver.nil?

          class_node = node.ancestors.find(&:class_type?)
          return unless class_node

          # Controllers and maintenance tasks already include the Loggable module
          return if is_maintenance_task?(class_node) || is_controller?(class_node)

          includes = class_node.each_child_node(:begin).first
          return if includes_nxt_loggable?(includes) || includes_nxt_core_loggable?(includes)

          add_offense(class_node, message: MSG) do |corrector|
            if includes
              corrector.insert_before(includes.child_nodes.first, "include Nxt::Loggable\n")
            end
          end
        end
      end
    end
  end
end
