class User < ApplicationRecord
    validates :name, presence: true
    validates :phone, presence: true, uniqueness: true
    has_many :sent_messages, class_name: "Message"
    has_many :received_messages, class_name: "Message", foreign_key: :recipient

    def messages
        sent_messages + received_messages
    end
end
