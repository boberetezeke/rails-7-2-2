class AddWidgets < ActiveRecord::Migration[7.2]
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :color
      t.timestamps
    end
  end
end
