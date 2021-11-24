class TodolistsController < ApplicationController

  def new
    # Viewに渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # .saveメソッドは、saveしつつ(?)それが成功すればtrueを返す
    if @list.save
      # リダイレクト
      redirect_to todolist_path(@list.id)
    else
      # render :アクション名で、同じコントローラ内の別アクションのViewを表示
      # @listにはエラーの内容が記入される
      render :new
    end


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
    params.require(:list).permit(:title, :body, :image)
  end


end
