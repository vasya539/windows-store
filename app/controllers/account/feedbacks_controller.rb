class Account::FeedbacksController < Account::AccountController
  def index
    @q = collection.ransack(params[:q])
    @feedbacks = @q.result.page(params[:page])
  end

  def show
    @feedback = resource
  end

  def destroy
    @feedback = resource
    @feedback.destroy

    redirect_to account_feedbacks_path, notice: 'Feedbacks was successfully destroyed.'
  end

  private

  def collection
    Feedback.all
  end

  def resource
    collection.find(params[:id])
  end
end
