class AddLockableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :failed_attempts, :integer
    add_column :users, :default, :0
    add_column :users, :null, :false
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
  end
end
