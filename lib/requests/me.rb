class Requests::Me
  def self.show(user)
    response = Requests::Me::GetRequest.get(user)

    status = response.key?(:errors) ? :not_found : :ok

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
