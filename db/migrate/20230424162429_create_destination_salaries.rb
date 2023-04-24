class CreateDestinationSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :destination_salaries do |t|
      t.references :destination, foreign_key: true
      t.references :salary, foreign_key: true
      t.timestamps
    end
  end
end
