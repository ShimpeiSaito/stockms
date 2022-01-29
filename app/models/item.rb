class Item < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"

    validates :name, presence: { message: "を入力してください" }
    validates :amount, presence: { message: "を入力してください" }
    validates :minimum, presence: { message: "を入力してください" }
    validates :category, presence: { message: "を選択してください" }

    class << self
        def search(query)
            rel = order(:name)
            if query.present?
                rel = rel.where("name LIKE ?", "%#{query}%")
            end
            rel
        end
    end
end
