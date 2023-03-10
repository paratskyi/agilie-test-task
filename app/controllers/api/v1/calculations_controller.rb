module Api
  module V1
    class CalculationsController < ApplicationController
      SERIALIZER_MAPPER = {
        'User' => ::Api::V1::UserSerializer,
        'Supplier' => ::Api::V1::SupplierSerializer,
        'Contract' => ::Api::V1::ContractSerializer
      }.freeze

      def create
        result = Conditions::Calculation.perform(condition)

        render json: result, each_serializer: SERIALIZER_MAPPER[condition.model], include: '**'
      end

      private

      def condition
        ::Condition.find(params[:condition_id])
      end
    end
  end
end
