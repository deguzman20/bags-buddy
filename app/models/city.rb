# create_table "cities", force: :cascade do |t|
#   t.string "name"
#   t.string "state_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class City < ApplicationRecord
  belongs_to :state
end
