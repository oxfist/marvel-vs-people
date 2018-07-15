module ApplicationHelper
  def nav_item(text, name)
    active_status = 'active' if params[:controller] == name
    tag.a(text, class: "nav-item nav-link mx-3 #{active_status}",
                href: url_for(controller: name, action: :index))
  end
end
