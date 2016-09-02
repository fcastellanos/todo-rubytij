class UserDecorator < BaseDecorator
  def to_hash
    return error_response if self.model.nil? || self.model.errors.any?

    {
      id: self.id,
      first_name: self.first_name,
      last_name: self.last_name
    }
  end

  private

  def error_response
    errors = self.model.nil? ? ['The user could not be found'] : self.model.errors.full_messages

    {
      errors: errors
    }
  end
end
