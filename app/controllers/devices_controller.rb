class DevicesController < ApplicationController
  def show
    @device = Device.find(params[:id])
  end

  def update
    device = Device.find(params[:id])
    device.run_all_zones
    flash[:info] = "all zones are now running for device #{device.id}"
    redirect_to device_path(id: device.id)
  end
end
