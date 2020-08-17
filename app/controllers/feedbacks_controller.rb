class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to root_url, notice: 'Feedback was successfully created.'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:user_full_name, :users_email, :city, :feedback)
  end
end
