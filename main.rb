require './cli/helper_cli'

@current_survey = nil
@current_question = nil
@current_user = nil

def main_menu
  header
  puts "T > Take a survey!"
  puts "A > Create a survey!"
  puts "E > Edit a survey!"
  puts "D > Delete a survey"
  puts "V > View survey results"
  puts "X > Exit"
  case gets.chomp.upcase
  when 'T'
    user_login
  when 'A'
    create_survey
  when 'E'
    edit_survey
  when 'D'
    delete_survey
  when 'V'
    list_responses
  when 'X'
    exit
  end
end




main_menu
