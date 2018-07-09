class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :description
      t.references :candidate, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
