class Api::V1::FlashcardsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_flashcard, only: [:show, :update, :destroy]
  def index
    @flashcards = policy_scope(Flashcard)
    # The policy_scope method is part of Pundit and will be used for authorization.
  end

  def show
  end

  def update
    if @flashcard.update(flashcard_params)
      render :show
    else
      render_error
    end
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)
    @flashcard.user = current_user
    authorize @flashcard
    if @flashcard.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @flashcard.destroy
    head :no_content
  end

  private
  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
    authorize @flashcard
  end

  def flashcard_params
    params.require(:flashcard).permit(:title, :front_content, :back_content)
  end

  def render_error
    render json: { errors: @flashcard.errors.full_messages },
      status: :unprocessable_entity
  end
end
