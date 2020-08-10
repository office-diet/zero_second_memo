class MemosController < ApplicationController
  before_action :set_memos, only: :index
  def index
    # binding.pry
  end
  def new
    @memo_tag = MemoTag.new
  end

  def create
    @memo_tag = MemoTag.new(memo_params)
    if @memo_tag.valid?
      @memo_tag.save
      @memo_tag = MemoTag.new
      redirect_to new_memo_path
    else
      render :new
    end

    # @memos_tags = Memo.inclueds(:tags)
    # @memos_tags.tags
  end


  private
  def set_memos
    @memos_tags = Memo.includes(:tags).where(user_id: current_user.id).order(id: :desc)
  end
  def memo_params
    params.require("memo_tag").permit(:theme, :text, tags: []).merge(user_id: current_user.id)
  end 
end
