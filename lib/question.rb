class Question < ActiveRecord::Base
  belongs_to :survey

  def assign_to survey_id

  end
end
