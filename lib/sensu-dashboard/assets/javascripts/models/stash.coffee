namespace 'SensuDashboard.Models', (exports) ->

  class exports.Stash extends Backbone.Model

    defaults:
      path: 'silence'
      content: {}

    idAttribute: 'path'

    isNew: =>
      !_.contains(SensuDashboard.Stashes.models, this)

    create: (attributes, options) =>
      options ||= {}
      options.wait = true
      Backbone.create(attributes, options)

    remove: (options = {}) =>
      @successCallback = options.success
      @errorCallback = options.error
      @destroy
        success: (model, response, opts) =>
          @successCallback.apply(this, [model, response, opts]) if @successCallback
        error: (model, xhr, opts) =>
          @errorCallback.apply(this, [model, xhr, opts]) if @errorCallback