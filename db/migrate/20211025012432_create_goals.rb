class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string     :target, null: false
      t.text       :reason
      t.datetime   :time,    null: false
      t.float      :achievement
      t.integer    :like
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
