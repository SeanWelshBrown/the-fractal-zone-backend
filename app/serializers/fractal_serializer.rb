class FractalSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :rule, :fractal_type, :user_id
end
