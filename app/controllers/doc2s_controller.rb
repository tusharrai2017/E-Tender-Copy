class Doc2sController < ApplicationController
  before_action :set_tender
  before_action :set_doc2, only: [:show, :edit, :update, :destroy, :download]

  # GET tenders/1/doc2s
  def index
    @doc2s = @tender.doc2s
  end

  # GET tenders/1/doc2s/1
  def show
  end

  # GET tenders/1/doc2s/new
  def new
    @doc2 = @tender.doc2s.build
  end

  # GET tenders/1/doc2s/1/edit
  def edit
  end

  def download
    @doc2s = @tender.doc2s
    @doc1s=  @tender.doc1s
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "DOC2",
        page_size: 'A4',
        template: "doc2s/download.pdf.erb",
        layout: "application.html.erb",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end    
  end


  # POST tenders/1/doc2s
  def create
    @doc2 = @tender.doc2s.build(doc2_params)

    if @doc2.save
      redirect_to([@doc2.tender, @doc2], notice: 'Doc2 was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tenders/1/doc2s/1
  def update
    if @doc2.update_attributes(doc2_params)
      redirect_to([@doc2.tender, @doc2], notice: 'Doc2 was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tenders/1/doc2s/1
  def destroy
    @doc2.destroy

    redirect_to tender_doc2s_url(@tender)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:tender_id])
    end

    def set_doc2
      @doc2 = @tender.doc2s.find(params[:id])
      @doc1 = @tender.doc1s.where(id: Doc1.where(tender_id: @tender.id).pluck(:id).join)
    end

    # Only allow a trusted parameter "white list" through.
    def doc2_params
      params.require(:doc2).permit(:debit_head, :item_name, :type, :quantity, :estimated_cost, :date, :time, :venue)
    end
end
