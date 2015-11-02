class WaitController < ApplicationController
  def index
    if delayed_response?
      @delay = params[:delay].to_i
      @start_time = Time.zone.now
      Rails.logger.info "Beginning #{@delay} second wait at #{@start_time.to_s}"
      Kernel.sleep(@delay)
      @end_time = Time.zone.now
      Rails.logger.info "Ending #{@delay} second wait at #{@end_time.to_s}"
    end
  end

  def delayed_response?
    params[:delay].present?
  end
  helper_method :delayed_response?
end
