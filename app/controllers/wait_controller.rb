class WaitController < ApplicationController
  def index
    @delay = params[:delay].to_i
    @start_time = Time.zone.now
    Rails.logger.info "Beginning #{@delay} second wait at #{@start_time.to_s}"
    Kernel.sleep(@delay)
    @end_time = Time.zone.now
    Rails.logger.info "Ending #{@delay} second wait at #{@end_time.to_s}"
  end
end
