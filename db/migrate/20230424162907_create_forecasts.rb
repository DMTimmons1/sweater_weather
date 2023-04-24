class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.references :destination, foreign_key: true
      t.string :summary
      t.string :temperature

      t.timestamps
    end
  end
end
