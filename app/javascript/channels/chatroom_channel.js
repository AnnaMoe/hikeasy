import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        // todo: figure it out a way of not making screen blink and losing focus on new message input
        messagesContainer.children[messagesContainer.children.length - 1].scrollIntoView();
      }
    });
  }
}

export { initChatroomCable };