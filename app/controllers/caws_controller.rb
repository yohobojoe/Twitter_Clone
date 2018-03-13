class CawsController < ApplicationController
  before_action :set_caw, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /caws
  # GET /caws.json
  def index
    @caws = Caw.all
  end

  # GET /caws/1
  # GET /caws/1.json
  def show
  end

  # GET /caws/new
  def new
    @caw = Caw.new
  end

  # GET /caws/1/edit
  def edit
  end

  # POST /caws
  # POST /caws.json
  def create
    @caw = Caw.create(caw_params)

    message_arr = @caw.message.split(" ")

    message_arr.each_with_index do |word, index|
      if word[0] == "#"
        if Tag.pluck(:phrase).include?(word)
          tag = Tag.find_by(phrase: word)
        else
          tag = Tag.create(phrase: word)
        end
        caw_tag = CawTag.create(caw_id: @caw.id, tag_id: tag.id)
        message_arr[index] = "<a href='/tag_caws?id=#{tag.id}'>#{word}</a>"
      end
    end

    @caw.update(message: message_arr.join(" "))

    respond_to do |format|
      if @caw.save
        format.html { redirect_to @caw, notice: 'Caw was successfully created.' }
        format.json { render :show, status: :created, location: @caw }
      else
        format.html { render :new }
        format.json { render json: @caw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caws/1
  # PATCH/PUT /caws/1.json
  def update
    respond_to do |format|
      if @caw.update(caw_params)
        format.html { redirect_to @caw, notice: 'Caw was successfully updated.' }
        format.json { render :show, status: :ok, location: @caw }
      else
        format.html { render :edit }
        format.json { render json: @caw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caws/1
  # DELETE /caws/1.json
  def destroy
    @caw.destroy
    respond_to do |format|
      format.html { redirect_to caws_url, notice: 'Caw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caw
      @caw = Caw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caw_params
      params.require(:caw).permit(:message, :user_id, :link)
    end
end
