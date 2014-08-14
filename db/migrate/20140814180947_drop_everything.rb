class DropEverything < ActiveRecord::Migration
  def change
    drop_table :surveys
    drop_table :questions
    drop_table :forms
    drop_table :responses
  end
end
