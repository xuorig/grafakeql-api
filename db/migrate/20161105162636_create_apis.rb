class CreateApis < ActiveRecord::Migration[5.0]
  def change
    create_table :apis do |t|
      t.text :schema_definition, limit: 4294967290
      t.string :uuid
      t.index :uuid
      t.timestamps
    end
  end
end
