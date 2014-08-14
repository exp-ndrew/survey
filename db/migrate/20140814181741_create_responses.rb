class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.column :question_id, :int
      t.column :answer_id, :int
      t.column :user_id, :int

      t.timestamps
    end
  end
end
