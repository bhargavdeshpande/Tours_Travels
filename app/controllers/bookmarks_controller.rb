class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
      	tour_creator = Tour.find_by(id: session[:tour_id])
	#Agent who created the tour
	if session[:role]==2 and session[:user_id] == tour_creator.user_id
		@bookmarks=Bookmark.where(tour_id: session[:tour_id])
    @new_bookmarks=[]
    @tourname=Tour.find_by(id: session[:tour_id])

    @bookmarks.each do |bookmark|
      entry={}
      @username=User.find_by(id: bookmark.user_id)
      entry[:user_name]=@username.name

      entry[:tour_name]=@tourname.name
      entry[:id] = bookmark.id
      @new_bookmarks.append(entry)
    end
    @bookmarks=@new_bookmarks
	#Customer
	elsif session[:role]==1
		@bookmarks=Bookmark.where(user_id: session[:user_id])
    @new_bookmarks=[]
    @username=User.find_by(id: session[:user_id])
    @tourname = []
    @bookmarks.each do |bookmark|
      entry={}

      entry[:user_name]=@username.name
      @tourname=Tour.find_by(id: bookmark.tour_id)
      entry[:tour_name]=@tourname.name
      entry[:id] = bookmark.id
      @new_bookmarks.append(entry)
    end
    @bookmarks=@new_bookmarks
    #tour=Tour.find_by(id: session[:tour_id])
	#Admin
	elsif session[:role]==3
		@bookmarks=Bookmark.all
	#Other agents
	else
		respond_to do |format|
        		format.html { redirect_to tours_url, notice: 'Agents can view bookmarks only of tours cretaed by them' }
		end
	end		
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
	if session[:role]==1
		@bookmark = Bookmark.new
	else
		respond_to do |format|
		        format.html { redirect_to tours_url, notice: 'Only customers can bookmark' }
		end
	end

  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
	#@bookmark = Bookmark.new(bookmark_params.merge(:user_id => session[:user_id]))
	@bookmark = Bookmark.new(bookmark_params.merge(:user_id => session[:user_id], :tour_id => session[:tour_id]))

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy

	if session[:user_id]==@bookmark.user_id or session[:role] == 3
     		@bookmark.destroy
    		respond_to do |format|
      			format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      			format.json { head :no_content }
    		end
	else
		respond_to do |format|
                        format.html { redirect_to bookmarks_url, notice: 'Only customers can delete bookmarks' }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      #params.fetch(:bookmark, {})
      params.permit(:user_id, :tour_id)
    end
end
