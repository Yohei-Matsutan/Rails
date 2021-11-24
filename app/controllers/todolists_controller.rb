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
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  private
  # ストロングパラメータを定義
  def list_params
    # viewにあるlist内のtitleとbodyに入力されたデータをlist_paramsに格納
    params.require(:list).permit(:title, :body)
  end


end
