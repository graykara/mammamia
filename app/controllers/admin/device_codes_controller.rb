class Admin::DeviceCodesController < ApplicationController
  before_action :set_admin_device_code, only: [:show, :edit, :update, :destroy]

  # GET /admin/device_codes
  # GET /admin/device_codes.json
  def index
    @admin_device_codes = DeviceCode.all
  end

  # GET /admin/device_codes/1
  # GET /admin/device_codes/1.json
  def show
  end

  # GET /admin/device_codes/new
  def new
    @admin_device_code = DeviceCode.new
  end

  # GET /admin/device_codes/1/edit
  def edit
  end

  # POST /admin/device_codes
  # POST /admin/device_codes.json
  def create
    @admin_device_code = DeviceCode.new(admin_device_code_params)

    respond_to do |format|
      if @admin_device_code.save
        format.html { redirect_to admin_device_codes_path, notice: 'Device code was successfully created.' }
        format.json { render :show, status: :created, location: @admin_device_code }
      else
        format.html { render :new }
        format.json { render json: @admin_device_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/device_codes/1
  # PATCH/PUT /admin/device_codes/1.json
  def update
    respond_to do |format|
      if @admin_device_code.update(admin_device_code_params)
        format.html { redirect_to admin_device_codes_path, notice: 'Device code was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_device_code }
      else
        format.html { render :edit }
        format.json { render json: @admin_device_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/device_codes/1
  # DELETE /admin/device_codes/1.json
  def destroy
    @admin_device_code.destroy
    respond_to do |format|
      format.html { redirect_to admin_device_codes_url, notice: 'Device code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_device_code
      @admin_device_code = DeviceCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_device_code_params
      # params[:admin_device_code]
      params.require(:device_code).permit!
    end
end
