require './cli/helper_cli'

@current_survey = nil
@current_question = nil

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
    start_survey
  when 'A'
    create_survey
  when 'E'
    edit_survey
  when 'D'
    delete_survey
  when 'V'
    view_results
  when 'X'
    exit
  end
end




main_menu
