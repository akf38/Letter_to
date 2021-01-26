class LettersController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  before_action :correct_user, only: [:destroy]
  
  def new
    @dead = Dead.find(params[:dead_id])
    @letter = Letter.new
  end
  
  def create
    @dead = Dead.find(params[:dead_id])
    @letter = @dead.letters.new(letter_params)
    if @letter.save
      flash[:success] = "投稿が完了しました。"
      redirect_to dead_path(@dead)
    else
      render 'letters/new'
    end
  end
  
  def destroy
    @dead = Dead.find(params[:dead_id])
    @letter = Letter.find(params[:id])
    @letter.destroy
    flash[:success] = "削除が完了しました"
    redirect_to dead_path(@dead)
  end
  
  private
  
  def letter_params
    params.require(:letter).permit(:name, :caption, :limage)
  end
  
  def correct_user
    @letter = Letter.find(params[:id])
    @dead = @letter.dead
    redirect_to root_url if @dead.user_id != current_user.id
  end
end
