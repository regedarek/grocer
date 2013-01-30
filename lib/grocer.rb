require 'grocer/feedback'
require 'grocer/notification'
require 'grocer/passbook_notification'
require 'grocer/feedback_connection'
require 'grocer/push_connection_pool'
require 'grocer/pusher'
require 'grocer/version'
require 'grocer/server'

module Grocer

  def self.env
    ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'
  end

  def self.feedback(options)
    connection = FeedbackConnection.new(options)
    Feedback.new(connection)
  end

  def self.pusher(options)
    pool = PushConnectionPool.new(options)
    Pusher.new(pool)
  end

  def self.server(options = { })
    ssl_server = SSLServer.new(options)
    Server.new(ssl_server)
  end

end
