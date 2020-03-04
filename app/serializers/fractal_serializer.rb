class FractalSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :parameters, :user_id, :username

  def username
    self.object.user.username
  end

end
