class CreateVoters < ActiveRecord::Migration[5.2]
  def change
    create_table :voters do |t|
      t.string :name
      t.string :last_name
      t.string :birth
      t.string :cedula
      t.references :role, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
