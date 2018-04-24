class CreateRequestTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :request_types do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
