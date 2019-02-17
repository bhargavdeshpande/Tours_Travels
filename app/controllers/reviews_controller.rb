class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  @@access = { 1 => { :new => true, :edit => true, :destroy => true},
      2 => {:new => false, :edit => false, :destroy => false},
      3 =>{:new => true, :edit => true, :destroy => true}}
  # GET /reviews
  # GET /reviews.json
  def index

    @reviews = Review.all

  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    if @@access[session[:role]][:new]
      @review = Review.new
    else
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Agent cannot write reviews.' }
      end
    end
  end

  # GET /reviews/1/edit
  def edit
    if @@access[session[:role]][:edit]== false or session[:user_id] != params[:review][:user_id]

       respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Only the creator can edit their reviews' }
      end
    end
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params.merge(:user_id => session[:user_id]))

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    if @@access[session[:role]][:destroy]== false or session[:user_id] != params[:review][:user_id]

      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Only the creator can delete their reviews' }
      end
    else
      @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:tourReview, :tour_id, :user_id)
    end
end
