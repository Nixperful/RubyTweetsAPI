class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
