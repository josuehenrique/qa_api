class CreateTenantRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :tenant_requests do |t|
      t.integer :tenant_id, null: false
      t.integer :amount, null: false, default: 0
      t.string :route, null: false

      t.timestamps(default: 'now')
    end

    add_foreign_key :tenant_requests, :tenants

    add_index :tenant_requests, [:created_at, :route, :tenant_id], unique: true
  end
end
