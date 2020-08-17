class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :user_full_name
      t.string :users_email
      t.string :city
      t.text :feedback
      t.boolean :show, default: false

      t.timestamps
    end
  end
end
