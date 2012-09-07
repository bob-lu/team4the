class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :required => true, :null => false
      t.string :password_digest, :required => true, :null => false
      t.string :nike_id, :default => ''
      t.string :nike_password, :default => ''
      t.integer :team_id
      t.timestamps
    end
  end
end
