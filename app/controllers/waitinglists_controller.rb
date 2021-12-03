class WaitinglistsController < ApplicationController
  

  # GET /waitinglists or /waitinglists.json
  def index
    @waitinglists = Waitinglist.where(id: params[:id])
  end

  # GET /waitinglists/1 or /waitinglists/1.json
  def show
  end

  # GET /waitinglists/new
  def new
    @waitinglist = Waitinglist.new
  end

  # GET /waitinglists/1/edit
  def edit
  end

  # POST /waitinglists or /waitinglists.json
  def create
    @waitinglist = Waitinglist.new(waitinglist_params)

    respond_to do |format|
      if @waitinglist.save
        format.html { redirect_to @waitinglist, notice: "Waitinglist was successfully created." }
        format.json { render :show, status: :created, location: @waitinglist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @waitinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waitinglists/1 or /waitinglists/1.json
  def update
    respond_to do |format|
      if @waitinglist.update(waitinglist_params)
        format.html { redirect_to @waitinglist, notice: "Waitinglist was successfully updated." }
        format.json { render :show, status: :ok, location: @waitinglist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @waitinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waitinglists/1 or /waitinglists/1.json
  def destroy
    @waitinglist.destroy
    respond_to do |format|
      format.html { redirect_to waitinglists_url, notice: "Waitinglist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waitinglist
      @waitinglist = Waitinglist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def waitinglist_params
      params.require(:waitinglist).permit(:user_id, :library_id)
    end
end
