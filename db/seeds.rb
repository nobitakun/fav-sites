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

Category.create(name: 'その他', slug: 'other')
Category.create(name: '動画', slug: 'video')
Category.create(name: 'ショッピング総合', slug: 'shopping')
Category.create(name: 'エンターテイメント', slug: 'entertainment')
Category.create(name: 'コスメ', slug: 'cosme')
Category.create(name: 'ファッション', slug: 'fasion')

Setting.create(slug: 'site_title', label: 'サイトタイトル', content: 'タイトル')
Setting.create(slug: 'home_meta_kayword', label: 'metaキーワード', content: 'キーワード1, キーワード2, キーワード3')
Setting.create(slug: 'home_meta_description', label: 'metaディスクリプション', content: 'ディスクリプションが入ります。')
Setting.create(slug: 'header_tag', label: 'ヘッダータグ', content: "<script>console.log('header_tag');</script>")
Setting.create(slug: 'footer_tag', label: 'フッタータグ', content: "<script>console.log('footer_tag');</script>")


Setting.create(slug: 'site_title', label: 'サイト1タイトル', content: 'タイトル')

url = 'https://www.youtube.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [2])

url = 'https://www.amazon.co.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [3])

url = 'https://www.yahoo.co.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [4])

url = 'https://www.rakuten.co.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [3])

url = 'https://kakaku.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [3])

url = 'http://radiko.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [1])

url = 'https://www.netflix.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [2])

url = 'https://www.happyon.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url, category_ids: [2])
