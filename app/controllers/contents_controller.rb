class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_content, only: [:edit, :update, :destroy]
  # GET /contents
  # GET /contents.json
  def index
    if current_user == nil
      @contents = Content.where(published: true).all
    else
      @contents = Content.where("published = ? OR user_id = ?", true, current_user.id).all
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find_by(slug: params[:id])
    redirect_to '/422.html' if not @content.published and (current_user == nil or current_user.id != @content.user_id)
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    @content.user_id = current_user.id

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def search
    if current_user == nil
      @contents = Content.where("published = ? and name like ?", true, "%#{params[:search]}%") .all
    else
      @contents = Content.where("(published = ? OR user_id = ?) and name like ?", true, current_user.id, "%#{params[:search]}%").all
    end
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find_by(slug: params[:id])
      redirect_to '/422.html' unless @content.user_id == current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:name, :content_type, :content, :image, :slug, :published)
    end
end
