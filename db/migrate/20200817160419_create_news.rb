class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :short_description
      t.text :description

      t.timestamps
    end
  end
end
