class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  def self.search(title)
    where(["title like?", "%#{title}%"])
  end

end
