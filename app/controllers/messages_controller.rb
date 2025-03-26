class MessagesController < ApplicationController
    def index
        render json: Message.all
    end

    def create
        if message.svae
end
