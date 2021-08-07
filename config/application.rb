ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)

require "bundler/setup" if File.exist?(ENV["BUNDLE_GEMFILE"])
Bundler.require

ENV["RACK_ENV"] ||= "development"

require 'sidekiq'
require 'sidekiq-cron'
require_relative '../app/workers/site_refresher_worker.rb'

module SiteRefresher
 class Application
   def self.root
     @root ||= File.dirname(File.expand_path('..', __FILE__))
   end

   def self.env
     @env ||= ENV["RAILS_ENV"] || ENV["RACK_ENV"] || ENV["ENV"] || "development"
   end

   def self.logger
     @logger ||= Logger.new(STDOUT)
   end
 end
end

require_relative "initializers/sidekiq"
