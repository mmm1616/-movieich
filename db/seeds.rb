# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = [
   {email: 'movieich@movieich.com', password: 'movieich'},
]

admins.each do |admin|
   admin_data = Admin.find_by(email: admin[:email])
   if admin_data.nil?
      Admin.create(email: admin[:email], password: admin[:password])
   end
end

users = [
   {email: 'hoge@example.com', password: '123456', name: '山田　太郎', kana_name: 'やまだ　たろう', user_name: 'たろうまる'},
   {email: 'hoge2@example.com', password: '123456', name: '山田　花子', kana_name: 'やまだ　はなこ', user_name: 'hanahana'},
   {email: 'hoge3@example.com', password: '123456', name: '鈴木　啓太', kana_name: 'すずき　けいた', user_name: 'けいたっちょ'},
   {email: 'hoge4@example.com', password: '123456', name: '田中　未来', kana_name: 'たなか　みらい', user_name: 'Future'},
   {email: 'hoge5@example.com', password: '123456', name: '杉山　きぬ', kana_name: 'すぎやま　きぬ', user_name: 'おきぬ'}
]

users.each do |user|
   user_data = User.find_by(email: user[:email])
   if user_data.nil?
      User.create(
         email: user[:email],
         password: user[:password],
         name: user[:name],
         kana_name: user[:kana_name],
         user_name: user[:user_name]
      )
   end
end

situations = [
   {name: 'わくわくしたい'},
   {name: 'きゅんきゅんしたい'},
   {name: '片思いの気持ちを共感したい'},
   {name: '思いっきり泣きたい'},
   {name: 'ハラハラドキドキしたい'},
   {name: '名作を観たい'},
   {name: 'みんなでワイワイしたい'},
]

situations.each do |situation|
   Situation.find_or_create_by(name: situation[:name])
end
