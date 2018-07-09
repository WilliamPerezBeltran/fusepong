class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :last_name
      t.string :party
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
  