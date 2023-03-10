module Api
  module V1
    class AssociationStructuresController < ApplicationController
      def create
        result = ::AssociationStructureGenerator.perform

        render json: result.to_json
      end
    end
  end
end
