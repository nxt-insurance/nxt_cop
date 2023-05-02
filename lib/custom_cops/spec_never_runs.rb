# frozen_string_literal: true

module Getsafe
  class SpecNeverRuns < RuboCop::Cop::Base
    def on_new_investigation
      path = processed_source.path
      return unless path.include?('/spec/') && !path.end_with?('_spec.rb')

      # Ignore non-spec files
      return if path.match?(/spec\/(support|factories)\//) # Helpers and factories
      return if path.match?(/(_examples|_helper)\.rb$/) # Shared examples

      if processed_source.raw_source.include?('RSpec.describe')
        add_global_offense("Spec file will never run because it is wrongly named")
      end
    end
  end
end