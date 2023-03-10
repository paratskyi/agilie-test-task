module Api
  module V1
    class ContractSerializer < ActiveModel::Serializer
      attributes :name, :description, :user_id, :supplier_id, :created_at, :updated_at
    end
  end
end
