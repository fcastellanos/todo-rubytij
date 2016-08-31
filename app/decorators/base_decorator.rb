require 'delegate'

class BaseDecorator < SimpleDelegator

  # Returns ref to the object we're decorating
  def model
    __getobj__
  end
end
