class SessionsController < ApplicationController
    def create
        member = User.find_by(login_id: params[:name])
        if member&.authenticate(params[:password])
            cookies.signed[:user_id] = { value: member.id, expires: 30.minutes.from_now } #10.seconds.from_now
        else
            flash.alert = "ログインIDとパスワードが一致しません"
        end
        redirect_to(:root)
    end
    
    def destroy
        cookies.delete(:user_id)
        redirect_to :root
    end
end
