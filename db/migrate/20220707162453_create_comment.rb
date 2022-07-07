class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
