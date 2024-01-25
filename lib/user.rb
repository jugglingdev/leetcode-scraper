require 'bcrypt'
require 'json'

class User
  attr_accessor :username, :password

  @@Users = []

  def initialize(username, password, existing_hash = false)
    @username = username
    @password = existing_hash ? 
                BCrypt::Password.new(password) :       
                BCrypt::Password.create(password)
    @@Users << self
  end

  def self.all
    @@Users
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)

    if user && user.password == password
      return user
    else
      return nil
    end
  end

  def self.find_by_username(username)
    user = all.find do |user|
      user.username == username
    end
  end

  def self.store_credentials(user)
    file_path = 'users.json'
    unless File.exist?(file_path)
      File.open(file_path, 'w') { |file| file.write(JSON.generate([]))}
    end

    file = File.read(file_path)
    users_data = JSON.parse(file)
    users_data << { username: user.username, password: user.password }

    File.open(file_path, 'w') { |file| file.write(JSON.generate(users_data)) }
  end

  def self.load_users_from_file
    file_path = 'users.json'
    if File.exist?(file_path)
      file = File.read(file_path)
      users_data = JSON.parse(file)
      users_data.each do |user_data|
        User.new(user_data['username'], user_data['password'], true)
      end
    end
  end

end
