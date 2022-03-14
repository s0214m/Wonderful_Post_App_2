# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザー3人
#メールアドレス: "user001@test.com"
#パスワード: "test1234"
#50個の記事
#タイトル: No.1: user001の記事
#本文:No.1: user001の記事の本文
#seedファイルを複数回実行しても、同じ内容のデータが出来ないように制御してください

users =
3.times.map do |i|
  User.find_or_create_by!(email: "user00#{i+1}@test.com") do |user|
    user.password = "test1234"
  end
end

users.each do |user|
  user_name = user.email.gsub("@test.com","")
  50.times do |i|
    user.articles.find_or_create_by!(title: "No.#{i+1}:#{user_name}の記事") do |article|
      article.content = "#{user_name}の記事の本文"
    end
  end
end

# users.each do |user|
#   user_name = user.email.gsub("@test.com","")
#   50.times do |i|
#     user.articles.find_or_initialize_by(title: "No.#{i+1}:#{user_name}の記事") do |article|
#       article.update!(content: "#{user_name}の記事の本文") if article.new_record?
#     end
#   end
# end

# 3.times do |i|
#   user = User.find_or_create_by!(email: "user00#{i+1}@test.com") do |_user|
#     _user.password = "test1234"
#   end

#   50.times do |ii|
#     user.articles.find_or_create_by!(title: "No.#{ii+1}:user00#{ii+1}の記事") do |article|
#       article.content = "user00#{ii+1}の記事の内容"
#     end
#   end
# end

# 3.times do |i|
#   user = User.find_or_create_by!(email: "user00#{i+1}@test.com") do |_user|
#     _user.password = "test1234"
#   end

#   50.times do |ii|
#     user.articles.find_or_initialize_by(title: "No.#{ii+1}:user00#{ii+1}の記事") do |article|
#       article.update!(content: "user00#{ii+1}の記事の内容") if article.new_record?
#     end
#   end
# end
