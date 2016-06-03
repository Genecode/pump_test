class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.string :impact
      t.string :likelihood
    end
  end
end
