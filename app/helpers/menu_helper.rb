module MenuHelper
  def section_btn_class(section)
    params[:section] == section ? '' : '-outline'
  end
end
