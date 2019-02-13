class Api::V1::DependentsController < ApplicationController
  before_action :set_dependent, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]
  # GET /api/v1/dependents
  def index
    @dependents = current_user.dependents
    render json: @dependents
  end
  # GET /api/v1/dependents/1
  def show
    render json: @dependent
  end
  # POST /api/v1/dependents
  def create
    @dependent = Dependent.new(dependent _params.merge(user: current_user))
    if @dependent.save
      render json: @dependent, status: :created
    else
      render json: @dependent.errors, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /api/v1/dependents/1
  def update
    if @dependent.update(dependent_params)
      render json: @dependent
    else
      render json: @dependent.errors, status: :unprocessable_entity
    end
  end
  # DELETE /api/v1/dependents/1
  def destroy
    @dependent.destroy
  end
  private
    def set_dependent
      @dependent = Dependent.find(params[:id])
    end
    def dependent_params
      params.require(:dependent).permit(:name, :parentesco)
    end
    def require_authorization!
      unless current_user == @dependent.user
      render json: {}, status: :forbidden
    end
  end
end
