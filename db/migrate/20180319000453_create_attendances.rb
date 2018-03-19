class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :student
      t.references :psychologist
      t.references :advisory, foreign_key: true
      t.boolean :assisted
      t.string :place
      t.date :init_date
      t.date :end_date
      t.string :topic

      t.timestamps
    end
  end
end
