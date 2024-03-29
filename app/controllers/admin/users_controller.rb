class Admin::UsersController < ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  # GET /admin/users.json
  def index
    if params[:commit] == '검색'
      if !params[:search].blank?
        @admin_users = User.search_by_category(params[:search], params[:category])
      elsif !(params[:start_date].blank? && params[:end_date].blank?)
        @admin_users = User.where('created_at > ? AND created_at <= ?', params[:start_date], params[:end_date])
      elsif !params[:step].blank?
        # case params[:step]
        #   when "1"
        #     @admin_contracts = Contract.with_hospital
        #   when "2"
        #     @admin_contracts = Contract.with_studio
        # end

      else
        @admin_users = User.all
      end

    else
      @admin_users = User.all
    end
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new
    @admin_user.partner_detail = PartnerDetail.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = User.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to @admin_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      # params[:admin_user]
      # params.require(:user).permit!
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation,
                                   partner_detail_attributes: PartnerDetail.attribute_names.collect { |attr| attr.to_sym }
      )
    end
end
