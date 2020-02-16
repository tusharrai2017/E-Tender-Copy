class TendersController < ApplicationController
  load_and_authorize_resource param_method: :my_sanitizer
  authorize_resource :class => false
  before_action :set_tender, only: [:show, :edit, :update, :destroy,:toggle_status]
  after_action :generate_ref_id, only: [:create,:update,:destroy]
  # GET /tenders
  # GET /tenders.json
  def index
    @tenders = Tender.all
  end

  # GET /tenders/1
  # GET /tenders/1.json
  def show

  end

  # GET /tenders/new
  def new
    @tender = Tender.new
  end

  # GET /tenders/1/edit
  def edit
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Tender.new(tender_params)
    @tender.user_id = current_user.id
    respond_to do |format|
      if @tender.save
        format.html { redirect_to @tender, notice: 'Tender was successfully created.' }
        format.json { render :show, status: :created, location: @tender }
      else
        format.html { render :new }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_status
    if @tender.published?
      @tender.draft! 
    else
      @tender.published!
    end
    redirect_to tenders_url
  end

  # PATCH/PUT /tenders/1
  # PATCH/PUT /tenders/1.json
  def update
    respond_to do |format|
      if @tender.update(tender_params)
        format.html { redirect_to @tender, notice: 'Tender was successfully updated.' }
        format.json { render :show, status: :ok, location: @tender }
      else
        format.html { render :edit }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender.destroy
    respond_to do |format|
      format.html { redirect_to tenders_url, notice: 'Tender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:id])
    end


    def my_sanitizer
      params.require(:tender).permit(:user_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tender_params
      params.require(:tender).permit(:title, :body)
    end

    def dept
      User.where(id: @tender.user_id).pluck(:department).join
    end

    def yeara
      @tender.created_at.strftime("%Y")
    end

    def srno
      first_of_month = Date.current.beginning_of_month
      last_of_next_month = (Date.current + 1.months).end_of_month
      Tender.where('created_at BETWEEN ? AND ?', first_of_month, last_of_next_month).published.count
    end

    def generate_ref_id
      @tender.ref_id="NITK/#{dept()}/FUND_TYPE/#{yeara()}/#{srno()}/"
      @tender.save!
    end
end
