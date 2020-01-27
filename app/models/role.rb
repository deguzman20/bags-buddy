# create_table "roles", force: :cascade do |t|
#   t.string "name"
#   t.string "resource_type"
#   t.bigint "resource_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
#   t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
# end
class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
