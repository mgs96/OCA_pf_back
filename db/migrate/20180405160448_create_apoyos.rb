class CreateApoyos < ActiveRecord::Migration[5.1]
  def change
    create_table :apoyos do |t|
      t.string :subject
      t.string :nrc
      t.string :day
      t.string :hour
      t.string :place
      t.string :peer
      t.string :email
      t.string :professor
      t.string :strategy

      t.timestamps
    end
  end
end
