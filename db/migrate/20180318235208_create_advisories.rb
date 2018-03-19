class CreateAdvisories < ActiveRecord::Migration[5.1]
  def change
    create_table :advisories do |t|
      t.string :type
      t.string :name
      t.string :schedule
      t.integer :sessions_number

      t.timestamps
    end
  end
end
