class Requests::Me::GetRequest
  def self.get(user)
    UserDecorator.new(user).to_hash
  end
end
