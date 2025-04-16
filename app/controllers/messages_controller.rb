class MessagesController < ApplicationController
    def index
      @messages = Message.all
      render json: @messages
    end

    def show
      @message = Message.find_by(id: params[:id])
      if @message
        render json: @message
      else
        render json: { error: "Message not found" }, status: :not_found
      end
    end

    def create
      @message = Message.new(message_params)
      if @message.save
        render json: @message, status: :created
      else
        render json: { errors: @message.errors.full_messages }, status: :not_valid
      end
    end

    def update
      @message = Message.find_by(id: params[:id])
      if @message
        if @message.update(message_params)
          render json: @message
        else
          render json: { errors: @message.errors.full_messages }, status: :not_valid
        end
      else
        render json: { error: "Message not found" }, status: :not_found
      end
    end

    def destroy
      @message = Message.find_by(id: params[:id])
      if @message
        @message.destroy
        render json: { message: "Message deleted" }
      else
        render json: { error: "Message not found" }, status: :not_found
      end
    end

    private
      def message_params
            params.require(:message).permit(:user_id, :recipient_id, :content)
      end
end
