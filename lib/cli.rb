require_relative 'scraper.rb'
require_relative 'user.rb'
require_relative 'problem.rb'

class CLI

  def run
    greeting
    User.load_users_from_file
    authenticate
    Scraper.scrape_data
    while menu != 'exit'
    end
    end_program
  end

  def greeting
    puts "Welcome to LeetCode Scraper!"
  end

  def authenticate
    authenicated = false

    until authenicated
      puts "Please log in or sign up"
      puts "Which do you choose?  (sign up/log in)"
      get_input = gets.chomp
      if get_input == 'log in'
        authenicated = login
      elsif get_input == 'sign up'
        create_account
      else
        puts "Please enter a valid option"
      end
    end
  end

  def login
    puts "Please enter your username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp

    result = User.authenticate(username, password)

    if result 
      puts "Welcome back, #{username}!"
    else
      puts "Invalid username or password"
    end

    result
  end

  def create_account
    puts "Please enter your username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp

    user = User.new(username, password)
    User.store_credentials(user)
    puts "Account created!"
  end  

  def menu
    list_options
    input = gets.chomp.downcase
    choose_option(input)
    input
  end

  def list_options
    puts "Please select an option: "
    puts "1. List 10 random Level 1 problems"
    puts "2. List 10 random Level 2 problems"
    puts "3. List 10 random Level 3 problems"
    puts "Exit the program by entering 'exit'"
  end

  def choose_option(option)
    case option
      when "1", "2", "3"
        level = option.to_i
        puts "Listing 10 random Level #{level} problems..."
        display_problems(fetch_random_problems(level))
      when "exit"
        puts "Exiting..."
    else
      puts "Invalid option"
    end
  end

  def fetch_random_problems(level)
    Problem.all.select { |problem| problem.difficulty['level'] == level }.sample(10)
  end

  def display_problems(problems)
    problems.each do |problem|
      puts "----------"
      puts "Title: #{problem.title}"
      puts "Link: #{problem.link}"
      puts "----------"
    end
  end

  def end_program
    puts "Thank you for using LeetCode Scraper!"
  end

end
