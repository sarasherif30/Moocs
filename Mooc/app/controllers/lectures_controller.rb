class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :get_courses, only: [:new, :edit, :update, :create]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @comments = Comment.where(lecture_id: @lecture).order("created_at DESC")
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def get_courses
    @courses = Course.where(user_id: current_user.try(:id))
  end
    
  def upvote
      @lecture = Lecture.find(params[:id])
      @lecture.upvote_from current_user
      redirect_to lecture_path
  end
  
   def downvote
       @lecture = Lecture.find(params[:id])
       @lecture.downvote_from current_user
       redirect_to lecture_path
  end
  
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user_id = current_user.id
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment,:course_id, :user_id)
    end
end
