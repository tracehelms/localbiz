class BusinessesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :set_business_for_review, only: [:new_review, :create_review]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.paginate(page: params[:page])
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business ||= current_user.businesses.build(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render action: 'show', status: :created, location: @business }
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    if @business.user == current_user
      @business.destroy
      respond_to do |format|
        format.html { redirect_to businesses_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to businesses_url, error: 'You do not have priviledges to destroy that Business.' }
        format.json { head :no_content }
      end
    end
  end

  def new_review
    @review ||= @business.reviews.build(user_id: current_user.id)
  end

  def create_review
    params[:user_id] = current_user.id
    @review ||= @business.reviews.build(review_params)
    # authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to @business, notice: 'Review was successfully created.' }
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
      end
    end
  end

private

    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
      authorize @business
    end

    def set_business_for_review
      @business = Business.find(params[:business_id])
      # authorize @business
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :category, :about,
        addresses_attributes: [:id, :line1, :line2, :city, :state, :zip, :phone, :_destroy],
        reviews_attributes: [:id, :user_id, :content, :rating, :_destroy]
      )
    end

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
