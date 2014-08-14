class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms, id: false do |t|
      t.column :question_id, :int
      t.column :response_id, :int
    end
    drop_table :questions_responses
  end
end
