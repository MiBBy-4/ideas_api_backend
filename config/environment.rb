# Load the Rails application.
require_relative "application"

links = File.join(Rails.root, 'links.env')
connection = File.join(Rails.root, 'connection.env')
load(links) if File.exist?(links)
load(connection) if File.exist?(connection)

# Initialize the Rails application.
Rails.application.initialize!
