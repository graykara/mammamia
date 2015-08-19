class Admin::ContractsController < ApplicationController
  before_action :set_admin_contract, only: [:show, :edit, :update, :destroy]

  # GET /admin/contracts
  # GET /admin/contracts.json
  def index
    if params[:commit] == '검색'
      if !params[:search].blank?

        whild_search = "%#{params[:search]}%"

        if params[:category] == 'hospital'
          @admin_contracts = Contract.joins(hospital_user: :partner_detail).where('partner_details.corp_name LIKE ?', whild_search)
        end

        if params[:category] == 'studio'
          @admin_contracts = Contract.joins(studio_users: :partner_detail).where('partner_details.corp_name LIKE ?', whild_search)
        end

      elsif !(params[:start_date].blank? && params[:end_date].blank?)
        @admin_contracts = Contract.where('manage_start_at > ? AND manage_start_at <= ?', params[:start_date], params[:end_date])
      else
        @admin_contracts = Contract.all
      end

    else
      @admin_contracts = Contract.all
    end

  end

  # GET /admin/contracts/1
  # GET /admin/contracts/1.json
  def show
  end

  # GET /admin/contracts/new
  def new
    @admin_contract = Contract.new
    @admin_contract.build_hospital_user
    @admin_contract.hospital_user.build_partner_detail
    @admin_contract.studio_users.build
    @admin_contract.studio_users.last.build_partner_detail
  end

  # GET /admin/contracts/1/edit
  def edit
    if @admin_contract.hospital_user.blank?
      @admin_contract.build_hospital_user
      @admin_contract.hospital_user.build_partner_detail
    end
    if @admin_contract.studio_users.blank?
      @admin_contract.studio_users.build
      @admin_contract.studio_users.last.build_partner_detail
    end
  end

  # POST /admin/contracts
  # POST /admin/contracts.json
  def create
    # render text: admin_contract_params

    assign_params = admin_contract_params.dup

    if assign_params[:hospital_user_attributes][:name].blank?
      assign_params.delete :hospital_user_attributes
    end

    if assign_params[:studio_users_attributes][:name].blank?
      assign_params.delete :studio_users_attributes
    end

    admin_contract_params = assign_params

    @admin_contract = Contract.new(admin_contract_params )

    respond_to do |format|
      if @admin_contract.save
        format.html { redirect_to admin_contracts_path, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @admin_contract }
      else
        format.html { render :new }
        format.json { render json: @admin_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/contracts/1
  # PATCH/PUT /admin/contracts/1.json
  def update
    assign_params = admin_contract_params.dup

    if admin_contract_params[:hospital_user_attributes][:password].blank?
      assign_params[:hospital_user_attributes].delete :password
      assign_params[:hospital_user_attributes].delete :password_confirmation
    end

    if admin_contract_params[:studio_users_attributes][:password].blank?
      assign_params[:studio_users_attributes].delete :password
      assign_params[:studio_users_attributes].delete :password_confirmation
    end

    respond_to do |format|
      if @admin_contract.update(assign_params)
        format.html { redirect_to admin_contracts_path, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_contract }
      else
        format.html { render :edit }
        format.json { render json: @admin_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/contracts/1
  # DELETE /admin/contracts/1.json
  def destroy
    @admin_contract.destroy
    respond_to do |format|
      format.html { redirect_to admin_contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_contract
      @admin_contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_contract_params
      # params[:admin_contract]
      # params.require(:contract).permit!
      params.require(:contract).permit(:id,
                                       :hospital_user_id, :marketing_user_id, :hospital_code, :studio_user_id, :partnership,
                                       :contracted_at, :contract_renewal,
                                       :setup_by, :setup_free, :setup_fee, :setup_vat,
                                       :equipment_by, :equipment_quantity, :equipment_free, :equipment_fee, :equipment_vat,
                                       :manage_by, :manage_start_at, :manage_period, :manage_vat, :manage_pay_by,
                                       :marketing_company_id, :marketing_user_name, :marketing_fee_use, :marketing_fee,
                                       :marketing_fee_ratio, :marketing_fee_vat, :marketing_equipment_fee_free, :marketing_equipment_fee,
                                       :marketing_equipment_fee_ratio, :marketing_equipment_fee_vat,
                                       hospital_user_attributes: [:id, :name, :email, :password, :password_confirmation,
                                                                  partner_detail_attributes: PartnerDetail.attribute_names.collect { |attr| attr.to_sym }
                                       ],
                                       studio_users_attributes: [:id, :name, :email, :password, :password_confirmation,
                                                                 partner_detail_attributes: PartnerDetail.attribute_names.collect { |attr| attr.to_sym }

                                       ]
      )
    end
end
