class UserDecorator < BaseDecorator
  def to_hash
    return error_response if self.model.nil?

    {
      id: self.id,
      first_name: self.first_name,
      last_name: self.last_name
    }
  end

  private

  def error_response
    {
      errors: ['The user could not be found']
    }
  end
end
