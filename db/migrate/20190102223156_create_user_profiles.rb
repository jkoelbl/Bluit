class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :display_name
      t.text :about
      t.integer :strength  # same as karma on reddit
      t.timestamps
    end
  end
end
