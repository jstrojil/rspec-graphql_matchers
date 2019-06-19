require_relative 'base_matcher'
require 'pry'

module RSpec
  module GraphqlMatchers
    class BeOfType < BaseMatcher
      attr_reader :sample, :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        sample.respond_to?(:type) && types_match?(sample.type, @expected)
      end

      def failure_message
        "expected field '#{member_name(sample)}' to be of type '#{expected}', " \
        "but it was '#{type_name(sample.type)}'"
      end

      def description
        "be of type '#{expected}'"
      end
    end
  end
end
