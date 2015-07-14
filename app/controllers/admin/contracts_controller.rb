class Admin::ContractsController < ApplicationController
  before_action :set_admin_contract, only: [:show, :edit, :update, :destroy]

  # GET /admin/contracts
  # GET /admin/contracts.json
  def index
    @admin_contracts = Contract.all
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
  end

  # POST /admin/contracts
  # POST /admin/contracts.json
  def create
    # render text: admin_contract_params
    @admin_contract = Contract.new(admin_contract_params)


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
    respond_to do |format|
      if @admin_contract.update(admin_contract_params)
        format.html { redirect_to @admin_contract, notice: 'Contract was successfully updated.' }
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
      params.require(:contract).permit(:id, :hospital_user_id,
                                       hospital_user_attributes: [:id, :name, :email, :password, :password_confirmation,
                                                                  partner_detail_attributes: PartnerDetail.attribute_names.collect { |attr| attr.to_sym }
                                       ],
                                       studio_users_attributes: [:id, :name, :email, :password, :password_confirmation,
                                                                 partner_detail_attributes: PartnerDetail.attribute_names.collect { |attr| attr.to_sym }

                                       ]
      )
    end
end
