class MemosController < ApplicationController
  before_action :set_memos, only: [:index, :new, :show, :tag]
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
    if params[:date].present?
      @date = params[:id].to_date
    else
      @memo_id = params[:id]
      @date = Memo.find(params[:id]).created_at.to_date
    end
  end

  def tag
    memo_ids = MemosTag.where(tag_id: params[:id]).select(:memo_id)
    @memos_tags_tag = Memo.includes(:tags).where(id: memo_ids).order(id: "desc")
  end

  private
  def set_memos
    @memos_tags = Memo.includes(:tags).where(user_id: current_user.id).order(id: :desc)
  end
  
  def memo_params
    params.require("memo_tag").permit(:theme, :text, tags: []).merge(user_id: current_user.id)
  end 
end
