class RachioService

  def initialize
    @_connection = Faraday.new( url: 'https://api.rach.io/1/public/' )
    connection.headers['Authorization'] = "Bearer #{token}"
    connection.headers['Content-Type'] = "application/json"
  end

  def find_user
    id = parse(connection.get('person/info'))[:id]
    get_user_info(id)
  end

  def get_user_info(id)
    parse(connection.get("person/#{id}"))
  end

  def get_device_info(id)
    parse(connection.get("device/#{id}"))
  end

  private
    def connection
      @_connection
    end

    def token
      ENV['rachio_api_key']
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
