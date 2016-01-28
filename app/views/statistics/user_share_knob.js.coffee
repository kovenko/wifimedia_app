$ ->
  buildGraph = (key, color, value, label) ->
    c3.generate

      bindto: '.' + key

      data:
        columns: [
          [label, value]
        ]
        type: 'gauge'

      color:
        pattern: [color]

      gauge:
        min: 0
        max: <%= @data[:total] %>
        label:
          format: (value, ratio) -> value

  buildGraph('less10', '#1F77B4', '<%= @data[:less10] %>', '<%= t('graph.user_share.visits', from: 1, to: 10) %>')
  buildGraph('less20', '#FF7F0E', '<%= @data[:less20] %>', '<%= t('graph.user_share.visits', from: 11, to: 20) %>')
  buildGraph('less30', '#2CA02C', '<%= @data[:less30] %>', '<%= t('graph.user_share.visits', from: 21, to: 30) %>')
  buildGraph('less40', '#D62728', '<%= @data[:less40] %>', '<%= t('graph.user_share.visits', from: 31, to: 40) %>')
  buildGraph('less50', '#9467BD', '<%= @data[:less50] %>', '<%= t('graph.user_share.visits', from: 41, to: 50) %>')
  buildGraph('more50', '#8C564B', '<%= @data[:more50] %>', '<%= t('graph.user_share.visits_more', from: 51) %>')