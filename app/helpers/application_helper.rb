module ApplicationHelper
  def render_which_partial(partial_name, &block)
    "<!-- Start to the partial #{partial_name} -->".html_safe +
      capture(&block) +
      "<!-- End to the partial #{partial_name} -->".html_safe
  end
end
