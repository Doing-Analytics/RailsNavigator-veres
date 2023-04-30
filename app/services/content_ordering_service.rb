class ContentOrderingService
  def initialize(args = {})
    debugger
    @model = args[:model]
    @highlighted = highlight
    @sorted = sort
  end

  def call
    {
      highlighted: @highlighted,
      sort_content: @sorted
    }
  end

  private

  def highlight
    highlighted_content = @model.where(highlighted: true).first
    highlighted_content || @model.first
  end

  def sort
    @model.where.not(id: @highlighted.id).order(created_at: :desc)
  end
end
