$ ->
  c3.generate
    bindto: '<%= params.try(:[], :users).try(:[], :graph_container).present? ? params[:users][:graph_container] : '.user-graph' %>'
    axis:
      x:
        type: 'timeseries'
        tick:
          format: '%d.%m.%Y'
    data:
      x: 'x'
      columns: [
        ['x',<%= raw @data[:dates] %>]
        <% if @data[:impressions_count].present? %>
        ['<%= t('.impressions_count') %>', <%= raw @data[:impressions_count] %>]
        <% end %>
        <% if @data[:unique_impressions_count].present? %>
        ['<%= t('.unque_impressions_count') %>', <%= raw @data[:unique_impressions_count] %>]
        <% end %>
        <% if @data[:phones_count].present? %>
        ['<%= t('dashboard.account_summary.sms_auth_count') %>', <%= raw @data[:phones_count] %>]
        <% end %>
      ]
      type: 'spline'
