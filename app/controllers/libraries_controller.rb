class LibrariesController < ApplicationController
  before_action :set_library, only: %i[ show edit update destroy ]


  

  # GET /libraries or /libraries.json
  def index
    @libraries = Library.all
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    else
      @user = false
    end
  end

  # GET /libraries/1 or /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    @library = Library.new
  end

  #Get /libraries/1
  def edit
  end


  def search
    if library_params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = library_params[:search].downcase
      # results = Coffeeshop. all.where ("lower (name) LIKE ?" "%#{@parameter}%")
      # @results = Coffee.joins(:reviews, :coffeeshops) .search (params [:search])
      @books = Library.where("lower(book_title) LIKE ?", "%#{@parameter}%" )
      @users = User.all.where("lower(name) LIKE ?", "%#{@parameter}%" )
      puts 'hiiiii'
      puts @books
      redirect_to libraries_search_path
    end
  end

  # POST /libraries or /libraries.json
  def create
    @library = Library.new(book_title: library_params[:book_title], author: library_params[:author], publish_year: 
    library_params[:publish_year], user_id: current_user.id)

    respond_to do |format|
      if @library.save
        format.html { redirect_to libraries_path, notice: "Library was successfully created." }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1 or /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to libraries_path, notice: "Library was successfully updated." }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1 or /libraries/1.json
  def destroy
    require 'pry'
    binding.pry
    @library.destroy
    respond_to do |format|
      format.html { redirect_to libraries_url, notice: "Library was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Post borrow_book/1 to borrow or check if you can borrow book
  def borrow
    @library = Library.find_by!(id: params[:id]) 
    Waitinglist.create(user_id: params[:id], library_id: params[:id]).save
    respond_to do |format|
      format.html { redirect_to waitinglists_url, notice: "You have been added to the waiting lists succsfully for that book." }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def library_params
    #   params.require(:library).permit(:id, :book_title, :author, :publish_year, :user_id, :search)
    # end
end
