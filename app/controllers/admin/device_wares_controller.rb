class Admin::DeviceWaresController < ApplicationController
  before_action :set_admin_device_ware, only: [:show, :edit, :update, :destroy]

  # GET /admin/device_wares
  # GET /admin/device_wares.json
  def index
    case params[:category]
      when 'fw'
        @admin_device_wares = DeviceWare.scope_by_category('fw')
      when 'sw'
        @admin_device_wares = DeviceWare.scope_by_category('sw')
      else
        @admin_device_wares = DeviceWare.scope_by_category('hw')
        params[:category] = 'hw'
    end
  end

  # GET /admin/device_wares/1
  # GET /admin/device_wares/1.json
  def show
  end

  # GET /admin/device_wares/new
  def new
    @admin_device_ware = DeviceWare.new
    params[:category] = 'hw' if params[:category].nil?
  end

  # GET /admin/device_wares/1/edit
  def edit
    params[:category] = 'hw' if params[:category].nil?
  end

  # POST /admin/device_wares
  # POST /admin/device_wares.json
  def create
    @admin_device_ware = DeviceWare.new(admin_device_ware_params)

    respond_to do |format|
      if @admin_device_ware.save
        params[:category] = 'hw' if params[:category].nil?
        format.html { redirect_to admin_device_wares_path(category: params[:category]), notice: '장비 히스토리 정보가 추가 되었습니다.' }
        format.json { render :show, status: :created, location: @admin_device_ware }
      else
        format.html { render :new }
        format.json { render json: @admin_device_ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/device_wares/1
  # PATCH/PUT /admin/device_wares/1.json
  def update
    respond_to do |format|
      if @admin_device_ware.update(admin_device_ware_params)
        params[:category] = 'hw' if params[:category].nil?
        format.html { redirect_to admin_device_wares_path(category: params[:category]), notice: '장비 히스토리 정보가 업데이트 되었습니다.' }
        format.json { render :show, status: :ok, location: @admin_device_ware }
      else
        params[:category] = 'hw' if params[:category].nil?
        format.html { render :edit, category: params[:category] }
        format.json { render json: @admin_device_ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/device_wares/1
  # DELETE /admin/device_wares/1.json
  def destroy
    @admin_device_ware.destroy
    respond_to do |format|
      format.html { redirect_to admin_device_wares_url, notice: 'Device ware was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_device_ware
      @admin_device_ware = DeviceWare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_device_ware_params
      # params[:admin_device_ware]
      params.require(:device_ware).permit!

    end
end
