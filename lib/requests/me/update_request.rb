class Requests::Me::UpdateRequest
  def self.update(user, params)
    user.update(params)

    UserDecorator.new(user).to_hash
  end
end
