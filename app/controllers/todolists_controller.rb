class TodolistsController < ApplicationController

  def new
    # Viewに渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存
    list.save
    # リダイレクト
    redirect_to '/top'
  end

  private
  # ストロングパラメータを定義
  def list_params
    # viewにあるlist内のtitleとbodyに入力されたデータをlist_paramsに格納
    params.require(:list).permit(:title, :body)
  end


end
