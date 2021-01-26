class DeadsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @dead = Dead.new
  end
  
  def create
    @dead = current_user.deads.build(dead_params)
    if @dead.save
      flash[:success] = "レターボックスの作成が完了しました。"
      redirect_to dead_path(@dead)
    else
      render 'deads/new'
    end
  end
  
  def show
    @dead = Dead.find(params[:id])
    @letters = @dead.letters.paginate(page: params[:page], per_page: 3)
  end
  
  def edit
    @dead = Dead.find(params[:id])
  end
  
  def update
    @dead = Dead.find(params[:id])
    if @dead.update(dead_params)
      flash[:success] = "故人の変更が保存されました。"
      redirect_to @dead
    else
      render 'deads/edit'
    end
  end
  
  def destroy
    @dead = Dead.find(params[:id])
    @dead.destroy
    flash[:success] = "故人のデータ削除が完了しました。"
    redirect_to current_user
  end
  
  private
  
  def dead_params
    params.require(:dead).permit(:name, :caption, :dimage)
  end
  
  def correct_user
    @dead = current_user.deads.find_by(id: params[:id])
    redirect_to root_url if @dead.nil?
  end
  
end
