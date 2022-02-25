class Post < ApplicationRecord
    validates :characters, presence: true
end
