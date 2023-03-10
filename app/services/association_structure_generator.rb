class AssociationStructureGenerator < ApplicationService
  ALLOWED_MODELS = [User, Supplier, Contract].freeze

  def perform
    generate_association_structure
  end

  private

  def generate_association_structure
    ALLOWED_MODELS.map do |model|
      {
        "#{model}": {
          associations: generate_associations(model),
          columns: model.column_names
        }
      }
    end
  end

  def generate_associations(model)
    model.reflections.map do |key, reflection|
      {
        name: key.to_s,
        columns: reflection.active_record.column_names
      }
    end
  end
end
