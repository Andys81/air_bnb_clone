class ReservationJob < ActiveJob::Base
  queue_as :default
  include Sidekiq::Worker

  def perform(*args)
    # Do something later
  end
end
