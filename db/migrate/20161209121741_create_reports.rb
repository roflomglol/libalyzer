class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.json :body
      t.text :raw
    end
  end
end
