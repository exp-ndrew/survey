class ChangeAnswerTextToString < ActiveRecord::Migration
  def change
    change_column :answers, :text, :string
  end
end
