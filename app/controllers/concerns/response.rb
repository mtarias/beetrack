# app/controllers/concerns/response.rb
module Response

    # API response
    def json_response(object, status = :ok)
      render json: object, status: status
    end
end