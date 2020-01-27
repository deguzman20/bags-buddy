# create_table "states", force: :cascade do |t|
#   t.string "region"
#   t.string "regional_designation"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class State < ApplicationRecord
  has_many :cities
end
