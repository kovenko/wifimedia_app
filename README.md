# wifimedia_app

Новые файлы:

1 app/assets/stylesheets/custom.css

Внесены изменения:

2 wifimedia_app/app/helpers/application_helper.rb

  Добавлена функция для коллекции иконок

  glyphicons_icon = html_options.delete(:glyphicons_icon)
    text = "#{glyphicons_icon(glyphicons_icon)} #{text}".html_safe if glyphicons_icon.present?

3 app/helpers/template_helper.rb

  Добавлена функция для коллекции иконок

  def glyphicons_icon(icon, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "glyphicon #{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

4 app/views/dashboard/

  Переделаны представления, старые можно удалить.

  Новые файлы:
  _one_row.html.haml
  _two_row_left_col.html.haml
  _two_row_right_col.html.haml
  index.html.haml

5 app/views/statistics/user_share_knob.js.coffee

  Заменить, включена передача цвета создаваемой диаграммы

6 app/views/statistics/users_summary.html.haml

  Заменены местами таблица и график, таблица обернума в тег <small>

  .panel-body
    .row
      %small.col-md-4.col-md-offset-8.user-table
    .row
      .col-md-12
        .user-graph.c3-charts

7 config/locales/ru.yml

  Добавлены строки - расшифровки

      visits_to_10:   "Новичок"
      visits_to_20:   "Резидент"
      visits_to_30:   "Знаменитость"
      visits_to_40:   "Звезда"
      visits_to_50:   "Суперзвезда"
      visits_over_50: "Легенда"

8 config/locales/views.ru.yml

  Зскомментарены сообщения старых представлений, добавлены новые

    account_summary:
#      total_views: Всего посещений системы
#      unique_count: Уникальные посетители
#      authorized_users: Идентифицированные пользователи
#      phone_count: Всего отправлено СМС
#      impressions_count: Доля просмотревших рекламу
#      hotspot_count: Количество задействованных Wifi точек
#      place_count: Количество подключенных заведений
      sms_auth_count: Идентификационные СМС
#      mailing_campaign_count: СМС в рассылках
    one_row:
      total_views: Всего подключений к сети
      unique_count: Уникальные пользователи сети
      authorized_users: Пользователи, прошедшие идентификацию
      send_auth_sms_count: Отправлено СМС для идентификации
      send_advert_sms_count: Отправлено рекламных СМС
      delivery_sms_all_auth_people: Отправить СМС посетителям
      show_advert_in_zaved: Показы рекламы в Ваших заведениях
      income_from_show_advert: Ваш доход от показов рекламы
      all_show_advert_in_city: Всего показов рекламы в вашем городе
      rub: руб

9 Требуется очеловечить в app/views/dashboard/index.html.haml
  - подключение файла стилей = stylesheet_link_tag "http://ekzn.ru:5000/assets/custom.css"
  - убрать лишние вызовы в партиалах, если имеются.



