module ApplicationHelper
  def authenticate
    html = "<input "
    html += "type='hidden' "
    html += "name='authenticity_token' "
    html += "value='#{form_authenticity_token}'>"

    html.html_safe
  end

  def main_index
    "<a href='#{bands_url}'><<--Back to Index</a>".html_safe
  end

end
