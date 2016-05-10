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

  def run_all_zones
    zones = self.zones.map{ |zone|
      attrs = {}
      attrs[:id] = zone[:id]
      attrs[:duration] = 30
      attrs[:sortOrder] = 5
      attrs
    }
    self.class.service.run_all_zones(zones)
  end
end
