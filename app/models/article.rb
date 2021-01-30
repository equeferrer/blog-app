class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 20}

  validates :body,  presence: true
end
