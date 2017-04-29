class Article < ApplicationRecord
  belongs_to :user
  
  validates :movie_title, presence: true
  validates :article_title, presence: true
  validates :director, presence: true
  validates :performer, presence: true
  validates :content, presence: true
  validates :release_date, presence: true
  validates :user_id, presence: true

  has_many :user_articles, class_name: 'UserArticle'
  has_many :users, through: :user_articles
  
end
