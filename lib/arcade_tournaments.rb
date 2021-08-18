# frozen_string_literal: true

require_relative "arcade_tournaments/version"
require_relative "arcade_tournaments/cli"
require_relative "arcade_tournaments/tournaments"
require_relative "arcade_tournaments/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'

module ArcadeTournaments
  class Error < StandardError; end
  # Your code goes here...
end
