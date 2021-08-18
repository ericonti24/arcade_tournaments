# frozen_string_literal: true

require_relative "arcade_tournaments/version"
require_relative "arcade_tournaments/cli"
require_relative "arcade_tournaments/months"
require_relative "arcade_tournaments/scraper"

require 'pry'
require 'nokogiri'

module ArcadeTournaments
  class Error < StandardError; end
  # Your code goes here...
end
