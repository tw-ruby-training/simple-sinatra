Sequel.migration do
  up do
    create_table :users do
      String :email, null: false, :index => true
      String :password, null: false
      primary_key :id
    end
  end

  down do
    drop_table :users
  end
end