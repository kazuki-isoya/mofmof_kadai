class PropertiesController < ApplicationController
  before_action :set_property, only: %i(show edit update destroy)

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
      redirect_to properties_path,  notice:"物件情報を登録しました！"
    else
      render :new
    end


  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice:"物件情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: '物件情報を削除しました！' }
    end
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :description, near_stations_attributes: %i(id route name walk_time property_id))
  end
end
