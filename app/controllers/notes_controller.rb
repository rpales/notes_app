class NotesController < AuthenticatedController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.json { render json: current_user.notes }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @note }
    end
  end

  def create
    @note = current_user.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.json { render json: @note, status: :created }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.json { render json: @note, status: :ok }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_note
      @note = current_user.notes.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :title)
    end
end
