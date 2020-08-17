class Account::NewsController < Account::AccountController
  def index
    @q = collection.ransack(params[:q])
    @news = @q.result.page(params[:page])
  end

  def show
    @news = resource
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to [:account, @news], notice: 'News was successfully created.'
    else
      render :new
    end
  end

  def edit
    @news = resource
  end

  def update
    @news = resource

    if @news.update(news_params)
      redirect_to [:account, @news], notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @news = resource
    @news.destroy

    redirect_to account_news_path, notice: 'News was successfully destroyed.'
  end

  private

  def collection
    News.all
  end

  def resource
    collection.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :short_description, :description)
  end
end
