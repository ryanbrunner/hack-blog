class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :date_of_birth
      t.string :gender
      t.integer :user_id

      t.timestamps null: false
    end
    
    User.find_each do |user|
      Profile.create({
        user_id: user.id,
        date_of_birth: user.date_of_birth
      })
    end
  end
end
