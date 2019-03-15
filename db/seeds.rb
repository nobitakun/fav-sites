# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー登録
root_user = User.new(name: 'root user', email: 'root@root.com', root: true, admin: true)
root_user.password = 'root'
root_user.password_confirmation = 'root'
root_user.save!

admin_user = User.new(name: '管理者', email: 'admin@admin.com', root: false, admin: true)
admin_user.password = 'admin'
admin_user.password_confirmation = 'admin'
admin_user.save!

test_user = User.new(name: 'テストユーザー', email: 'test@test.com', root: false, admin: false)
test_user.password = 'test'
test_user.password_confirmation = 'test'
test_user.save!

admin_user.marks.create(name: 'YouTube', url: 'https://www.youtube.com/')
admin_user.marks.create(name: 'amazon', url: 'https://www.amazon.co.jp/')
admin_user.marks.create(name: 'Yahoo', url: 'https://www.yahoo.co.jp/')
admin_user.marks.create(name: '楽天', url: 'https://www.rakuten.co.jp/')
admin_user.marks.create(name: '価格.com', url: 'https://kakaku.com/')

admin_user.marks.create(name: 'radiko.jp', url: 'http://radiko.jp/')
admin_user.marks.create(name: 'NETFLIX', url: 'https://www.netflix.com//')
admin_user.marks.create(name: 'hulu', url: 'https://www.happyon.jp/')
