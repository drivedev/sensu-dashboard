namespace "SensuDashboard.Collections", (exports) ->

  class exports.Base extends Backbone.Collection
    longPolling: false

    intervalSeconds: 10

    _timeoutId: -1

    startLongPolling: (intervalSeconds) =>
      @longPolling = true
      @intervalSeconds = intervalSeconds if intervalSeconds
      @executeLongPolling()

    stopLongPolling: =>
      @longPolling = false

    executeLongPolling: =>
      @fetch
        success: =>
          @onFetch()
        reset: true
        data:
          backend_name: $('#backends').val()

    onFetch: =>
      clearTimeout(@timeoutId) if @longPolling
      @timeoutId = setTimeout(@executeLongPolling, 1000 * @intervalSeconds) if @longPolling
