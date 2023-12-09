class Api::V1::FlashcardsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_flashcard, only: [:show, :update, :destroy]
  def index
    Rails.logger.info "Authorization Header: #{request.headers['Authorization']}"
    @flashcards = policy_scope(Flashcard)
    # The policy_scope method is part of Pundit and will be used for authorization.
    render json: @flashcards
  end

  def show
    render json: @flashcard
  end

  def update
    if @flashcard.update(flashcard_params.except(:tags))
      associate_tags(@flashcard, flashcard_params[:tags])
      render json @flashcard, include: :tags
    else
      render_error
    end
  end

  def create
    @flashcard = Flashcard.new(flashcard_params.except(:tags))
    @flashcard.user = current_user
    authorize @flashcard
    associate_tags(@flashcard, flashcard_params[:tags])
    if @flashcard.save
      render json: @flashcard, include: :tags, status: :created
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
    params.require(:flashcard).permit(:title, :front_content, :back_content, tags: [])
  end

  def render_error
    render json: { errors: @flashcard.errors.full_messages },
      status: :unprocessable_entity
  end

  def associate_tags(flashcard, tag_names)
    return unless tag_names.present?
    flashcard.tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
  end
end
