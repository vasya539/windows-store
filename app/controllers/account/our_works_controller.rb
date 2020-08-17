class Account::OurWorksController < Account::AccountController
  def index
    @q = collection.ransack(params[:q])
    @our_works = @q.result.page(params[:page])
  end

  def show
    @our_work = resource
  end

  def new
    @our_work = OurWork.new
  end

  def create
    @our_work = OurWork.new(our_work_params)

    if @our_work.save
      redirect_to [:account, @our_work], notice: 'our_work was successfully created.'
    else
      render :new
    end
  end

  def edit
    @our_work = resource
  end

  def update
    @our_work = resource

    if @our_work.update(our_work_params)
      redirect_to [:account, @our_work], notice: 'Our Work was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @our_work = resource
    @our_work.destroy

    redirect_to account_our_works_path, notice: 'Our Work was successfully destroyed.'
  end

  private

  def collection
    OurWork.all
  end

  def resource
    collection.find(params[:id])
  end

  def our_work_params
    params.require(:our_work).permit(:title, :description)
  end
end
