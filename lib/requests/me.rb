class Requests::Me
  def self.show(user)
    response = Requests::Me::GetRequest.get(user)

    status = response.key?(:errors) ? :not_found : :ok

    build_response(response, status)
  end

  def self.update(user, params)
    response = Requests::Me::UpdateRequest.update(user, params)

    status = response.key?(:errors) ? :unprocessable_entity : :ok

    build_response(response, status)
  end

  private

  def self.build_response(body, status)
    {
      json: body,
      status: status
    }
  end
end
