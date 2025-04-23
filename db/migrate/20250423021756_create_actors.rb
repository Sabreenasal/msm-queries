class CreateActors < ActiveRecord::Migration[7.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.date :dob
      t.string :image_url

      t.timestamps
    end
  end
end
