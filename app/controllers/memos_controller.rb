class MemosController < ApplicationController
  before_action :set_memos, only: [:index, :new, :show, :tag]
  before_action :set_all_tags, only: [:index, :new, :show, :tag]
    
  def new
    @new_memo = MemoTag.new
    @date = Date.today.to_date
    @list_memos = @memos.where(created_at: @date.in_time_zone.all_day)
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
      @date = params[:date].to_date
      @list_memos = @memos.where(created_at: @date.in_time_zone.all_day)
      if params[:id] != "0"
        @memo = @memos.find(params[:id])
      else
        @memo = @memos.where(created_at: @date.in_time_zone.all_day).first
      end
    else
      @memo = @memos.find(params[:id])
      @date = @memo.created_at.to_date
      @list_memos = @memos.where(created_at: @date.in_time_zone.all_day)
    end
  end

  def tag
      @tag_id = params[:tag]
      memo_ids = MemosTag.where(tag_id: @tag_id).select(:memo_id)
      @list_memos = Memo.includes(:tags).where(id: memo_ids).order(id: "desc")
      @tag = Tag.find(params[:tag]).name
      if params[:id] != "0"
        @memo = @list_memos.find(params[:id])
      else
        @memo = @list_memos.first
      end
  end

  private
  def set_memos
    @memos = Memo.includes(:tags).where(user_id: current_user.id).order(id: :desc)
    @side_memos = @memos.select(:created_at, :theme)
  end
  
  def set_all_tags
    memo_ids = Memo.where(user_id: current_user.id).select(:id)
    tag_ids = MemosTag.where(memo_id: memo_ids)
    @tags = Tag.where(id: tag_ids)
  end

  def memo_params
    params.require("memo_tag").permit(:theme, :text, tags: []).merge(user_id: current_user.id)
  end 
end
