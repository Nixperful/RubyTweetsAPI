module Api
    module V1
        class TweetsController < ApplicationController
            include ActionController::HttpAuthentication::Token::ControllerMethods

            before_action :authenticate, only:[:create, :destroy]

            def index
                @tweets = Tweet.order('created_at DESC')
                render json: @tweets
            end

            def create
                @tweet = @user.tweets.new(tweet_params)
                if @tweet.save
                    render json: @tweet, status: :created
                else
                    render json: @tweet.errors, status: :unprocessable_entity
                end
            end

            def destroy
                
                @tweet = @user.tweets.find(params[:id])
                
                if @tweet
                    @tweet.destroy
                    render json: {tweet: @tweet.id}, status: :deleted
                else
                    render json: {tweet: "Not Found"}, status: :not_found
                end
            end

            private
            def authenticate
                authenticate_or_request_with_http_token do |token, options|
                    @user = User.find_by(token: token)
                end
            end

            private
            def tweet_params
                params.require(:tweet).permit(:title,:body)
            end

        end
    end
end