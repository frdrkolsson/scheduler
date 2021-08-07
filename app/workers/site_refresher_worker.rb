require 'net/http'

class SiteRefresherWorker
  include Sidekiq::Worker

  def perform(*args)
    uri = URI('http://www.gustafholmberg.com')
    Net::HTTP.get(uri)
  end
end
