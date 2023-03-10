module Api
  module V1
    class ConditionSerializer < ActiveModel::Serializer
      attributes :value, :operator, :comparable, :model, :created_at, :updated_at
    end
  end
end
