# Load the Rails application.
require_relative "application"

links = File.join(Rails.root, 'links.env')
load(links) if File.exist?(links)

# Initialize the Rails application.
Rails.application.initialize!
