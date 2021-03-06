FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials}
    email                  {Faker::Internet.free_email}
    password               {'aaa111'}
    password_confirmation  {password}
    last_name              {'山田'}
    first_name             {'太郎'}
    ruby_last_name         {'ヤマダ'}
    ruby_first_name        {'タロウ'}
    birthday               {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end
