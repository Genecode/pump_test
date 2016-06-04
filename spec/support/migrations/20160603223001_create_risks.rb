class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.string :impact
      t.string :likelihood
      t.references :scale, null: false
    end
  end
end
