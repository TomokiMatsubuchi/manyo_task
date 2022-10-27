module TasksHelper
  def sort_task
    if params[:sort_deadline_on]
      @tasks = @tasks.deadline
    elsif params[:sort_priority]
      @tasks = @tasks.priority.default_order
    end
  end

  def search_task
    if  params[:search].present?
      search_title = params["search"]["title"]
      search_status = params["search"]["status"]
      if search_status.present? && search_title.present?
        @tasks = @tasks.search_status(search_status).search_title(search_title)
      elsif search_title.present?
        @tasks = @tasks.search_title(search_title)
      elsif search_status.present?
        @tasks = @tasks.search_status(search_status)
      end
    end
  end
end
