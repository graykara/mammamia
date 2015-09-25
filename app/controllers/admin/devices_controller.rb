class Admin::DevicesController < ApplicationController
  before_action :set_admin_device, only: [:show, :edit, :update, :destroy]

  # GET /admin/devices
  # GET /admin/devices.json
  def index
    @admin_devices = Device.all
    if params[:commit] == '검색'
      if !params[:search].blank?
        @admin_contracts = Contract.search_by_user_type(params[:search], params[:category])
      elsif !(params[:start_date].blank? && params[:end_date].blank?)
        @admin_contracts = Contract.where('manage_start_at > ? AND manage_start_at <= ?', params[:start_date], params[:end_date])
      elsif !params[:step].blank?
        case params[:step]
          when "1"
            @admin_contracts = Contract.with_hospital
          when "2"
            @admin_contracts = Contract.with_studio
        end

      else
        @admin_contracts = Contract.all
      end

    else
      @admin_contracts = Contract.all
    end
  end

  def list
    @admin_contract = Contract.find(params[:contract_id])
    @admin_devices = @admin_contract.devices
    @contract_hospital = @admin_contract.hospital_user

    if @admin_devices.count < @admin_contract.equipment_quantity
      1.upto(@admin_contract.equipment_quantity) do
        @admin_contract.devices.create!
      end
    end
  end

  def update_list
    params[:admin_device].keys.each do |id|
      @device = Device.find(id.to_i)
      @device.update_attributes(params[:admin_device][id])
    end
    redirect_to(device_lists_path)
  end

  # GET /admin/devices/1
  # GET /admin/devices/1.json
  def show
  end

  # GET /admin/devices/new
  def new
    @admin_device = Device.new
  end

  # GET /admin/devices/1/edit
  def edit
    @admin_contract = Contract.find(params[:id])
  end

  # POST /admin/devices
  # POST /admin/devices.json
  def create
    @admin_device = Device.new(admin_device_params)

    respond_to do |format|
      if @admin_device.save
        format.html { redirect_to @admin_device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @admin_device }
      else
        format.html { render :new }
        format.json { render json: @admin_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/devices/1
  # PATCH/PUT /admin/devices/1.json
  def update
    # respond_to do |format|
    #   if @admin_device.update(admin_device_params)
    #     format.html { redirect_to @admin_device, notice: 'Device was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @admin_device }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @admin_device.errors, status: :unprocessable_entity }
    #   end
    # end
    @admin_contract = Contract.find(params[:id])
    respond_to do |format|
      if @admin_contract.update(admin_contract_params)
        format.html { redirect_to admin_devices_path, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_device }
      else
        format.html { render :edit }
        format.json { render json: @admin_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/devices/1
  # DELETE /admin/devices/1.json
  def destroy
    @admin_device.destroy
    respond_to do |format|
      format.html { redirect_to admin_devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_device
      @admin_device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_device_params
      # params[:admin_device]
      params.require(:device).permit!
    end

    def admin_contract_params
      params.require(:contract).permit(:id,
                                       :hospital_user_id, :marketing_user_id, :hospital_code, :studio_user_id, :partnership,
                                       :contracted_at, :contract_renewal,
                                       :setup_by, :setup_free, :setup_fee, :setup_vat,
                                       :equipment_by, :equipment_quantity, :equipment_free, :equipment_fee, :equipment_vat,
                                       :manage_by, :manage_start_at, :manage_period, :manage_vat, :manage_pay_by,
                                       :marketing_company_id, :marketing_user_name, :marketing_fee_use, :marketing_fee,
                                       :marketing_fee_ratio, :marketing_fee_vat, :marketing_equipment_fee_free, :marketing_equipment_fee,
                                       :marketing_equipment_fee_ratio, :marketing_equipment_fee_vat, :note)
    end
end
