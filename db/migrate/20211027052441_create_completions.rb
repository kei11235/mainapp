class CreateCompletions < ActiveRecord::Migration[6.1]
  def change
    create_table :completions do |t|
      t.string     :content, null: false
      t.references :goal,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
