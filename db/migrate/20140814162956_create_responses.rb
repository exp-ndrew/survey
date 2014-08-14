class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.column :text, :string

      t.timestamps
    end
  end
end
