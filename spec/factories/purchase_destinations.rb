FactoryBot.define do
  factory :purchase_destination do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    area_id {2}
    municipality {"墨田区"}
    address {"1-2-3"}
    building_name {"ソラマチ"}
    phone_number {"09012345678"}
  end
end
