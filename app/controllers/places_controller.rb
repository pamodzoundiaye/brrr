class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
    @q = Place.search(params[:q])
    @neededPlaces = @q.result(distinct: true)
    @c = Category.all
  end
  def ventes
    @places = Place.all
  end
  def guide
  end
  def locations
    @places = Place.all
  end
  def shared
    @places = Place.all
  end
  def auberge
    @places = Place.all
  end
  def courtiers
    @users = User.all
    @q = User.search(params[:q])
    @court = @q.result(distinct: true)
  end
  def shop
    @owner=User.find(params[:type]);
    @ownedPlaces=Place.where(uid: @owner.id)
  end
  def pubs
    @pubPlaces=Place.where(uid: current_user.id)
  end
  def admin
    @pubPlaces=Place.where(uid: current_user.id)
  end

  # GET /places/1
  # GET /places/1.json
  def show
    e=Eye.new
    if current_user!=nil
      if Eye.exists?(viewer: current_user.id, viewee: @place.id)
      else
        e.viewer=current_user.id
        e.viewee=@place.id
        @place.views=@place.views+1
        e.save 
        @place.save
      end      
    else
        e.viewee=@place.id
        @place.views=@place.views+1
        e.save 
        @place.save
    end
    
  end

  def like
    @place=Place.find(params[:place_id])
    puts "somebody liked "+String(@place.id)+" ..."
    e=Aime.new
    if current_user!=nil
      if Aime.exists?(liker: current_user.id, liked: @place.id)
      else
        e.liker=current_user.id
        e.liked=@place.id
        @place.likes=@place.likes+1
        e.save 
        @place.save
      end      
    else
        e.liked=@place.id
        @place.likes=@place.likes+1
        e.save 
        @place.save
    end
  end

  def dislike
    @place=Place.find(params[:place_id])
    if current_user!=nil  
      Aime.where(liker: current_user.id, liked: @place.id).destroy_all
    end
    @place.likes = @place.likes - 1
    @place.save
  end

  
  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    @place.views=0
    @place.likes=0
    if @place.price==nil
      @place.price=0
    end
    @place.uid = current_user.id
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :description, :categoryName, :price, :availability, :furnitures, :daily, :monthly, :picture1, :picture2, :picture3, :picture4, :picture5, :location, :forSale, :forRent, :shared, :auberge)
    end
end
