class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.string :title
      t.string :min
      t.string :max

      t.timestamps
    end
  end
end
