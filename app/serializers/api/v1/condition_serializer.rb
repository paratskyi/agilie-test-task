module Api
  module V1
    class ConditionSerializer < ActiveModel::Serializer
      attributes :value, :operator, :model, :associations_chain, :created_at, :updated_at
    end
  end
end
