# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー登録
root_user = User.new(name: 'root user', email: 'root@root.com', root: true, admin: true, confirmed_at: Date.new(2019, 4, 2))
root_user.password = 'rootroot'
# root_user.password_confirmation = 'root'
root_user.save!
config = root_user.build_user_config
config.mark_target = 0
config.language_setting = 0
config.col_num = 4
config.save!


admin_user = User.new(name: '管理者', email: 'admin@admin.com', root: false, admin: true, confirmed_at: Date.new(2019, 4, 2))
admin_user.password = 'adminadmin'
# admin_user.password_confirmation = 'admin'
admin_user.save!
config = admin_user.build_user_config
config.mark_target = 0
config.language_setting = 0
config.col_num = 4
config.save!


test_user = User.new(name: 'テストユーザー', email: 'test@test.com', root: false, admin: false, confirmed_at: Date.new(2019, 4, 2))
test_user.password = 'testtest'
# test_user.password_confirmation = 'test'
test_user.save!
config = test_user.build_user_config
config.mark_target = 0
config.language_setting = 0
config.col_num = 4
config.save!

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
Setting.create(slug: 'confirmation_mail_text', label: '登録メールの本文', content: '下のリンクからユーザー登録を完了してください。')

Setting.create(slug: 'default_site_title_1', label: 'デフォルトサイト1:タイトル', content: 'Google')
Setting.create(slug: 'default_site_url_1', label: 'デフォルトサイト1:URL', content: 'https://www.google.co.jp/')

Setting.create(slug: 'default_site_title_2', label: 'デフォルトサイト2:タイトル', content: 'YouTube')
Setting.create(slug: 'default_site_url_2', label: 'デフォルトサイト2:URL', content: 'https://www.youtube.com/')

Setting.create(slug: 'default_site_title_3', label: 'デフォルトサイト3:タイトル', content: 'Amazon')
Setting.create(slug: 'default_site_url_3', label: 'デフォルトサイト3:URL', content: 'https://www.amazon.co.jp/')

Setting.create(slug: 'default_site_title_4', label: 'デフォルトサイト4:タイトル', content: '楽天市場')
Setting.create(slug: 'default_site_url_4', label: 'デフォルトサイト4:URL', content: 'https://www.rakuten.co.jp/')

Setting.create(slug: 'default_site_title_5', label: 'デフォルトサイト5:タイトル', content: 'Yahoo!ショッピング')
Setting.create(slug: 'default_site_url_5', label: 'デフォルトサイト5:URL', content: 'https://shopping.yahoo.co.jp/')



url = 'https://www.youtube.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)

url = 'https://www.amazon.co.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)

url = 'https://www.yahoo.co.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)

url = 'https://www.rakuten.co.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)

url = 'https://kakaku.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)

url = 'http://radiko.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)

url = 'https://www.netflix.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)

url = 'https://www.happyon.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
admin_user.marks.create(title: title, url: url)
