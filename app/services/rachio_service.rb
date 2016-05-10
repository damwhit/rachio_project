class RachioService

  def initialize
    @_connection = Faraday.new( url: 'https://api.rach.io/1/public/' )
    connection.headers['Authorization'] = "Bearer #{token}"
    connection.headers['Content-Type'] = "application/json"
  end

  def get_user_info
    connection.get('person/info')
  end

  private
    def connection
      @_connection
    end

    def token
      ENV['rachio_api_key']
    end
end
