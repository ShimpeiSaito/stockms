class Item < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"

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
