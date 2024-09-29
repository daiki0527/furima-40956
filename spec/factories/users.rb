FactoryBot.define do
  factory :user do
    nickname              { 'ヤマ' }
    email                 { 'aaaa@gmail.com' }
    encrypted_password    { 'aaaa111' }
    confirmation_password { 'aaaa111' }
    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birth                 { '2000/01/01' }
  end
end
