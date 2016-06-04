class CreateScales < ActiveRecord::Migration
  def change
    create_table :scales do |t|
      t.text :impacts, null: false
      t.text :likelihoods, null: false
    end
  end
end
