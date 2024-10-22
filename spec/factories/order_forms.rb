FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    area_id { 2 }
    city { '埼玉県' }
    address { '川越市的場新町' }
    building { '10-8' }
    telephone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
