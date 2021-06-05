import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
  // Called once when the subscription is created.


  // Called when the subscription is ready for use on the server.
  connected() {
    // console.log("Connected to the activity channel..")
    this.perform("appear")
  
  },

  // Called when the WebSocket connection is closed.
  disconnected() {
    
  },

  received(data) {
    console.log(data)
    let elements = document.querySelectorAll(`.user-${data.user_id}-status`)
    console.log(elements)
    elements.forEach(element => {
      if (data.status == "online") {
        element.classList.add("online")
      } else {
        element.classList.remove("online")
      }
    })
  },
})