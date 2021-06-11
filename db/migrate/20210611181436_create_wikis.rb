class CreateWikis < ActiveRecord::Migration[6.0]
  def change
    create_table :wikis do |t|
      t.text :question
      t.text :answer
      t.string :type
      t.string :subtype

      t.timestamps
    end
  end
end
