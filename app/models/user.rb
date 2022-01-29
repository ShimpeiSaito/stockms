class User < ApplicationRecord
    has_secure_password

    has_many :items, dependent: :destroy

    attr_accessor :current_password
    validates :password, presence: { if: :current_password }

    validates :user_id, presence: { message: "を入力してください" }
    validates :name, presence: { message: "を入力してください" },
            format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/, allow_blank: true, message: "は空白なし、ひらがな,カタカナ,漢字,英文字のみで入力してください。" }
end
