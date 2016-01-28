module ApplicationHelper
  def time_spent_in_words secs
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if secs > 0
        secs, n = secs.divmod(count)
        "#{n.to_i} #{t("datetime.prompts.#{name}")}"
      end
    }.compact.reverse.join(' ')
  end

  def body_data_page
    path = controller.controller_path.split('/')
    namespace = path.first if path.second

    [namespace, controller.controller_name, controller.action_name].compact.join(':')
  end

  def page_block_class
    case controller_name
    when 'users'
      'bg-teal'
    when 'hotspots'
      'bg-blue-grey'
    when 'dashboard'
      'bg-indigo'
    when 'mailing_campaigns'
      'bg-teal'
    else
      'bg-blue'
    end
  end

  def link_to(text = nil, options = nil, html_options = nil, &block)
    html_options = html_options.clone rescue {}

    tooltip = html_options.delete(:tooltip)

    if tooltip.present?
      html_options['data-toggle'] = 'tooltip'
      html_options['data-original-title'] = tooltip
    end

    fa_icon = html_options.delete(:fa_icon)
    text = "#{fa_icon(fa_icon)} #{text}" if fa_icon.present?

    ion_icon = html_options.delete(:ion_icon)
    text = "#{ion_icon(ion_icon)} #{text}".html_safe if ion_icon.present?

    glyphicons_icon = html_options.delete(:glyphicons_icon)
    text = "#{glyphicons_icon(glyphicons_icon)} #{text}".html_safe if glyphicons_icon.present?

    super(text, options, html_options)
  end

  def only_url_params
    params.except(*request.path_parameters.keys)
  end

  def date_formatter(obj)
    begin
      obj.strftime('%d.%m.%Y')
    rescue
      nil
    end
  end
end
