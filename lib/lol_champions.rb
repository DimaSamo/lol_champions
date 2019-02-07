require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "lol_champions/version"
require_relative "lol_champions/cli"
require_relative "lol_champions/champion"
require_relative "lol_champions/scraper"
require_relative "lol_champions/role"
module LolChampions
  class Error < StandardError; end
  # Your code goes here...
end
