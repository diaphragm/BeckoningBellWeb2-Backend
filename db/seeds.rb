# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bell = Bell.create(place: 'せいけも前', password: 'ggg', note: 'SL4。1周目')
bell.messages.create(user: '狩りの主', body: 'かねて血を畏れたまえ')
bell.messages.create(user: '聖歌隊', body: '宇宙は空にある')
bell.messages.create(user: '処刑隊', body: 'この街を清潔にいたしましょう')

bell2 = Bell.create(place: '聖杯ダンジョン', password: '123', note: '冒涜アメン')
bell2.messages.create(user: '異常者', body: '神秘乗算放射')
bell2.messages.create(user: '墓暴き', body: '血質形状変化全マイ')
bell2.messages.create(user: '女王殺し', body: '血質32.6%')
