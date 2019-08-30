class CreateRisks < ActiveRecord::Migration[5.2]
  def change
    create_table :risks do |t|
      t.string :impact
      t.string :likelihood
      t.references :scale, null: false
    end
  end
end
