module Api
  module V1
    class SupplierSerializer < ActiveModel::Serializer
      attributes :name, :spend, :created_at, :updated_at
    end
  end
end
