# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

require 'faker'

# Users
user1 = User.create(email: Faker::Internet.email, password: 'password123')
user2 = User.create(email: Faker::Internet.email, password: 'password123')

# Blogs
blog1 = Blog.create(name: Faker::Name.name, user: user1)
blog2 = Blog.create(name: Faker::Name.name, user: user2)

# Topics
if Topic.where(highlighted: true).blank?
  rails = Topic.create(name: 'Rails Guide', introduce: 'Ning X Ted , 合作翻譯rails guide , 為自己而學，不為誰')
end
topic1 = Topic.create(name: Faker::Quote.singular_siegler, introduce: Faker::Quote.famous_last_words)
topic2 = Topic.create(name: Faker::Quote.singular_siegler, introduce: Faker::Quote.famous_last_words)

# Categories
category1 = Category.create(name: Faker::Nation.capital_city)
category2 = Category.create(name: Faker::Nation.capital_city)
category3 = Category.create(name: Faker::Nation.capital_city)
category4 = Category.create(name: Faker::Nation.capital_city)

# Tags

tag1 = Tag.create(name: Faker::Color.color_name)
tag1.article!
tag2 = Tag.create(name: Faker::Color.color_name)
tag2.article!
tag3 = Tag.create(name: Faker::Color.color_name)
tag3.article!
tag4 = Tag.create(name: Faker::Color.color_name)
tag4.article!

# Articles
article1 = Article.create(title: Faker::Quotes::Chiquito.term, content: Faker::Quote.matz, user: user1,
                          category: category1)
article2 = Article.create(title: Faker::Quotes::Chiquito.term, content: Faker::Quote.matz, user: user1,
                          category: category2)
article3 = Article.create(title: Faker::Quotes::Chiquito.term,
                          content: Faker::Quote.matz, user: user2, category: category3)
article4 = Article.create(title: Faker::Quotes::Chiquito.term, content: Faker::Quote.matz,
                          user: user2, category: category4)

# BlogArticles
BlogArticle.create(blog: blog1, article: article1)
BlogArticle.create(blog: blog1, article: article2)
BlogArticle.create(blog: blog2, article: article3)
BlogArticle.create(blog: blog2, article: article4)

# TopicArticles
TopicArticle.create(topic: topic1, article: article1)
TopicArticle.create(topic: topic1, article: article2)
TopicArticle.create(topic: topic2, article: article3)
TopicArticle.create(topic: topic2, article: article4)

# ArticleTags
ArticleTag.create(article: article1, tag: tag1)
ArticleTag.create(article: article2, tag: tag2)
ArticleTag.create(article: article3, tag: tag3)
ArticleTag.create(article: article4, tag: tag4)

# Topics
topic1 = Topic.create(name: Faker::Book.genre)
topic2 = Topic.create(name: Faker::Book.genre)
topic3 = Topic.create(name: Faker::Book.genre)

# Tags
if rails
  tag_rails = Tag.create(name: 'Guide')
  tag_rails.topic!
end
tag1_to = Tag.create(name: Faker::Hobby.activity)
tag1_to.topic!
tag2_to = Tag.create(name: Faker::Hobby.activity)
tag2_to.topic!
tag3_to = Tag.create(name: Faker::Hobby.activity)
tag3_to.topic!
tag4_to = Tag.create(name: Faker::Hobby.activity)
tag4_to.topic!
tag5_to = Tag.create(name: Faker::Hobby.activity)
tag5_to.topic!

# TopicTags
TopicTag.create(topic: topic1, tag: tag_rails) if rails

TopicTag.create(topic: topic1, tag: tag1_to)
TopicTag.create(topic: topic1, tag: tag2_to)
TopicTag.create(topic: topic2, tag: tag3_to)
TopicTag.create(topic: topic3, tag: tag4_to)
TopicTag.create(topic: topic3, tag: tag5_to)
