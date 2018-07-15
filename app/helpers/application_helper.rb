module ApplicationHelper
  def alert(notice, type)
    tag.div(class: "alert alert-#{type} alert-dismissible", role: 'alert') do
      tag.span(notice) + dismiss_button
    end
  end

  def nav_item(text, name)
    active_status = 'active' if params[:controller] == name
    tag.a(text, class: "nav-item nav-link mx-3 #{active_status}",
                href: url_for(controller: name, action: :index))
  end

  private

  def dismiss_button
    tag.button(type: 'button', class: 'close', data: { dismiss: 'alert' },
               aria: { label: 'Close' }) do
      tag.span('&times;'.html_safe, aria: { hidden: true })
    end
  end
end
