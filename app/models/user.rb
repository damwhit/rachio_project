class User
  attr_reader :full_name,
              :devices

  def initialize(data)
    @full_name = data[:fullName]
    @devices = data[:devices]
  end

  def self.service
    RachioService.new
  end

  def self.find
    User.new(service.find_user)
  end
end
