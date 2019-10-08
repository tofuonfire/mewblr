class RemoveUnconfirmedEmailFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :unconfirmed_email, :string
  end
end
