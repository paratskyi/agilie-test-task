module Conditions
  class Calculation < ApplicationService
    def initialize(condition)
      @condition = condition
    end

    def perform
      calculate_condition
    end

    private

    def calculate_condition
      @condition.model.constantize.includes(includes_hash).where(where_hash)
    end

    def includes_hash
      @condition.associations_chain[0..-2].reverse.inject do |value, key|
        assigned_value = value.is_a?(Hash) ? value : value.to_sym
        assigned_key = key.is_a?(Hash) ? key : key.to_sym

        { assigned_key => assigned_value }
      end
    end

    def where_hash
      @condition.associations_chain.reverse.inject(@condition.value) do |value, key|
        assigned_value = value.is_a?(Hash) || value == @condition.value ? value : value.to_sym
        assigned_key = key.is_a?(Hash) ? key : key.to_sym

        { assigned_key => assigned_value }
      end
    end
  end
end
