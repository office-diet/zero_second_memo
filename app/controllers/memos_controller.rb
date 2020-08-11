class MemosController < ApplicationController
  before_action :set_memos, only: [:index, :new, :show]
  def index
  end
  def new
    @memo_tag = MemoTag.new
    @date = Date.today.to_date
  end

  def create
    @memo_tag = MemoTag.new(memo_params)
      if @memo_tag.valid?
      @memo_tag.save
      redirect_to new_memo_path and return
    else
      set_memos
      render :new and return
    end
  end

  def show
    @date = params[:id].to_date
  end

  private
  def set_memos
    @memos_tags = Memo.includes(:tags).where(user_id: current_user.id).order(id: :desc)
  end
  
  def memo_params
    params.require("memo_tag").permit(:theme, :text, tags: []).merge(user_id: current_user.id)
  end 
end
