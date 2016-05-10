class Device
  attr_reader :id,
              :status,
              :zones

  def initialize(data)
    @id = data[:id]
    @status = data[:status]
    @zones = data[:zones]
  end

  def self.service
    RachioService.new
  end

  def self.find(id)
    Device.new(service.get_device_info(id))
  end
end
