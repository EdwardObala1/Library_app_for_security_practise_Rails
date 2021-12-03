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
    respond_to do |format|
      if @library.user_id == 0
        format.html { redirect_to borrow_book_url, notice: "You have borrowed the book awaiting approval from Linrarian" }
      else
        format.html { redirect_to borrow_book_url, notice: "Book has already been borrowed if you want to be added to the waiting list click on the button below" }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:book_title, :author, :publish_year, :user_id)
    end
end
