require 'sidekiq-scheduler'
class ReportWorker
  include Sidekiq::Worker
  #sidekiq_options retry: false


  def perform
  	#sleep 15
    #puts "SIDEKIQ WORKER GENERATING A REPORT"
    Function.check
  end

end
