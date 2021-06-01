import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
  // Called once when the subscription is created.
  initialized() {
    this.update = this.update.bind(this)
  },

  // Called when the subscription is ready for use on the server.
  connected() {
    // console.log("Connected to the activity channel..")
    this.perform("appear")
  
  },

  // Called when the WebSocket connection is closed.
  disconnected() {
    this.uninstall()
  },

  received(data) {
    console.log(data.message)
  },



  appear() {
    // Calls `AppearanceChannel#appear(data)` on the server.
    this.perform("appear", { appearing_on: this.appearingOn })
  },

  install() {
    window.addEventListener("focus", this.update)
    window.addEventListener("blur", this.update)
    document.addEventListener("turbolinks:load", this.update)
    document.addEventListener("visibilitychange", this.update)
  },

  uninstall() {
    window.removeEventListener("focus", this.update)
    window.removeEventListener("blur", this.update)
    document.removeEventListener("turbolinks:load", this.update)
    document.removeEventListener("visibilitychange", this.update)
  },

  get documentIsActive() {
    return document.visibilityState == "visible" && document.hasFocus()
  },

  get appearingOn() {
    const element = document.querySelector("[data-appearing-on]")
    return element ? element.getAttribute("data-appearing-on") : null
  }
})