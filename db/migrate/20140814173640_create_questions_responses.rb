class CreateQuestionsResponses < ActiveRecord::Migration
  def change
    create_table :questions_responses, id: false do |t|
      t.belongs_to :question
      t.belongs_to :response
    end
  end
end
