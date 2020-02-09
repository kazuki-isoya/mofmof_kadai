class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    @property.near_stations.build
  end

  def edit
    unless @property.near_stations.last.walk_time.blank?
      @property.near_stations.build
    end
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path,  notice:"登録しました！"
    else
      render :new
    end


  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice:"編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :description, near_stations_attributes: [:id, :route, :name, :walk_time, :property_id])
  end
end
