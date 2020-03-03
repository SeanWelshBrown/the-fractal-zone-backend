class FractalSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :rule, :fractal_type, :user_id, :username

  def username
    self.object.user.username
  end

end
