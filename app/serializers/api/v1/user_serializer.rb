module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :first_name, :last_name, :created_at, :updated_at
    end
  end
end
