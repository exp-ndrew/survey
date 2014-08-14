class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :question_id, :int
      t.column :text, :int

      t.timestamps
    end
  end
end
