def user_login
  puts "Enter your name:"
  @current_user = User.find_or_create_by(name: gets.chomp)
  start_survey
end
