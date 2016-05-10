class User
  def self.service
    RachioService.new
  end

  def self.find
    service.get_user_info
  end
end
