module TemplateHelper
  # width : 1..12
  # color only for heading
  # color: red pink purple deep-purple
  #       indigo blue light-blue cyan
  #       teal green light-green lime
  #       yellow amber orange deep-orange
  #       brown
  #       grey blue-grey
  #       panel-transparent
  def panel(width: 12, color: '', center: false, &block)
    col_class = "col-md-#{ width }"
    col_class += ' col-centered' if center

    content_tag :div, class: col_class do
      content_tag :div, class: "panel #{ color }" do
        yield
      end
    end
  end

  def row_panel(width: 12, color: '', css_class: '', center: false, &block)
    row_class = 'row ' + css_class
    row_class += ' row-centered' if center

    content_tag :div, class: row_class do
      panel width: width, color: color, center: center do
        yield
      end
    end
  end

  def fa_icon(icon, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "fa fa-#{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

  def ion_icon(icon, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "ion-#{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

  def glyphicons_icon(icon, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "glyphicon #{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

  def available_hotspot_pages
    arr = []

    types =
      current_user.has_role?(:advertiser) ? Hotspot::Page::TEMPLATE_TYPES[1].split(',') : Hotspot::Page::TEMPLATE_TYPES

    types.map do |type|
      arr << [t("hotspot_pages.#{type}"), type]
    end

    arr
  end

  def prefill_page_owner(page)
    page.persisted? ? page.user_id : current_user.id
  end

  def preview_form_values(page, field)
    if page.present?
      res = page.send("#{field}")

      value = (
      case field
        when 'logo', 'background_landscape', 'background_portrait'
          if res.blank?
            nil
          else
            Hotspot::Page.storage_host.to_s + res.to_s
          end
        else
          page.send("#{field}")
      end
      )
    end
  end

  def page_color_scheme
    arr = []
    %w(red green blue black white).each do |color|
      arr << [t("hotspots.pages.colors.#{color}"), color]
    end

    arr
  end

  def preloader_color
    arr = []
    %w(dark light).each do |color|
      arr << [t("hotspots.pages.preloader_colors.#{color}"), color]
    end

    arr
  end

  def to_rub(val)
    "#{val.to_i} руб."
  end
end
