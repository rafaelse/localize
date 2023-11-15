class AddAuthenticationTokenToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :authentication_token, :string
    add_index :customers, :authentication_token
  end
end
