require 'nokogiri'
require 'open-uri'
require 'json'
require 'byebug'
require_relative 'problem.rb'

class Scraper
  URL = "https://leetcode.com/api/problems/algorithms/"

  def self.scrape_data
    puts "Scraping data..."
    unparsed_page = URI.open(URL)
    doc = Nokogiri::HTML(unparsed_page)
    extract_problem_data(doc)
  end

  def self.extract_problem_data(doc)
    json_data = JSON.parse(doc.css("body").text)

    json_data['stat_status_pairs'].each do |problem_data|
      title = problem_data['stat']['question__title']
      link = "https://leetcode.com/problems/#{problem_data['stat']['question__title_slug']}/"
      difficulty = problem_data['difficulty']
      Problem.new(title, link, difficulty) if difficulty
    end
  end

end
