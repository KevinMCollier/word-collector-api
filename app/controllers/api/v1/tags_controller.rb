class Api::V1::TagsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_tag, only: [:show]

  def index
    # @tags = current_user.flashcards.joins(:tags).select('tags.*').distinct
    @tags = policy_scope(Tag)
    render json: @tags
  end

  def show
    render json: @tag
  end

  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def create
    @tag = Tag.find_or_create_by(tag_params)
    render kson: @tag, status: :created
  end

  def autocomplete
    query = params[:query]
    @tags = Tag.where('name LIKE ?', "%#{query}%")
    render json: @tags
  end

  def destroy
    @tag.destroy
    head :no_content
  end
  private

  def set_tag
    @tag = Tag.find(params[:id])
    authorize @tag
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end

# Just adding a comment here as a test.
