class MemosController < ApplicationController
  before_action :set_memos, only: :index
  def index
    # binding.pry
  end
  def new
    @memo = Memo.new
  end

  def create
    binding.pry
    @memo = Memo.new(memo_params)
    if @memo.valid?
      @memo.save
      @memo = Memo.new
      redirect_to new_memo_path
    else
      render :new
    end
  end


  private
  def set_memos
    @memos = Memo.where(user_id: current_user.id)
  end
  def memo_params
    params.require("memo").permit(:theme, :text).merge(user_id: current_user.id)
  end 
end
