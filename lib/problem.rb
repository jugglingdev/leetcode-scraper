class Problem

    attr_accessor :title, :link, :difficulty
  
    @@all_problems = []
  
    def initialize(title, link, difficulty)
      @title = title
      @link = link
      @difficulty = difficulty
      @@all_problems << self
    end
  
    def self.all
      @@all_problems
    end
  
  end
  