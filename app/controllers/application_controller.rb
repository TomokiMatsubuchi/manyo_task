class ApplicationController < ActionController::Base
  include TasksHelper, SessionsHelper
  before_action :login_required, :logout_required
  

  private

  def login_required
    redirect_to new_session_path, flash: {alert: "ログインしてください"} unless current_user
  end

  def logout_required #ログイン中にログイン画面・アカウント作成画面へ飛んだ時の処理
    if logged_in? #current_userがnilか判断
      if request.fullpath == "/sessions/new" #request.fullpathで現在のpathを取得
        flash[:alert] = "ログアウトしてください" #ログイン画面にいたら移動
        redirect_to tasks_path
      elsif request.fullpath == "/users/new" #request.fullpathで現在のpathを取得
        flash[:alert] = "ログアウトしてください" #アカウント作成画面にいたら移動
        redirect_to tasks_path
      end
    end
  end
end
