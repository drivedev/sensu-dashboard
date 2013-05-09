namespace "SensuDashboard", (exports) ->

  class Application

    constructor: ->
      $.ajaxSetup(cache: false)

      bootstrapper = new SensuDashboard.Bootstrapper
        success: =>
          @boot()

        error: =>
          new SensuDashboard.Views.Error
          toastr.error("Error during bootstrap. Is Sensu API running?"
            , "Bootstrap Error"
            , { positionClass: "toast-bottom-right" })

      $('#backends').bind 'change', @_change_backends

    boot: ->
      Backbone.history.start()

    _change_backends: ->
      toastr.info("You are now viewing data from #{$('#backends').val()}"
            , "Changed backends"
            , { positionClass: "toast-top-right" })

      SensuDashboard.Stashes.executeLongPolling()
      SensuDashboard.Events.executeLongPolling()
      SensuDashboard.Clients.executeLongPolling()
      SensuDashboard.Checks.executeLongPolling()
      SensuDashboard.Info.executeLongPolling()

  exports.App = new Application() # Initialize app
