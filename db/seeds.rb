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

Setting.create(slug: 'head_tag', label: 'headタグ冒頭', content: "<script>console.log('head_tag');</script>")
Setting.create(slug: 'header_tag', label: 'ヘッダー下', content: "<p>ヘッダー下表示テスト</p>")
Setting.create(slug: 'footer_tag', label: 'フッター上', content: "<p>フッター上表示テスト</p>")
Setting.create(slug: 'body_end_tag', label: 'bodyタグ末尾', content: "<script>console.log('body_end_tag');</script>")


Setting.create(slug: 'footer_link', label: 'フッターリンク', content: '<li class="nav-item"><a class="nav-link text-muted" href="/"><i class="fa fa-angle-right mr-2"></i>プライバシーポリシー</a></li>')
Setting.create(slug: 'confirmation_mail_text', label: '登録メールの本文', content: '下のリンクからユーザー登録を完了してください。')

DefaultMark.create(title: 'Google', url: 'https://www.google.co.jp/', order_num: '1')
DefaultMark.create(title: 'YouTube', url: 'https://www.youtube.com/', order_num: '2')
DefaultMark.create(title: 'Amazon', url: 'https://www.amazon.co.jp/', order_num: '3')
DefaultMark.create(title: '楽天市場', url: 'https://www.rakuten.co.jp/', order_num: '4')
DefaultMark.create(title: 'Yahoo!ショッピング', url: 'https://shopping.yahoo.co.jp/', order_num: '5')


url = 'https://www.yahoo.co.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
test_user.marks.create(title: title, url: url)

url = 'https://kakaku.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
test_user.marks.create(title: title, url: url)

url = 'http://radiko.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
test_user.marks.create(title: title, url: url)

url = 'https://www.netflix.com/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
test_user.marks.create(title: title, url: url)

url = 'https://www.happyon.jp/'
agent = Mechanize.new
page = agent.get(url)
title = page.title
test_user.marks.create(title: title, url: url)
