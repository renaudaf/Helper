import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.querySelector('.message-container');
  const allMessages = document.querySelector('.all-msg-chat');
  const chatConsole = document.querySelector('.chat-console');
  if (messagesContainer) {
    const id = messagesContainer.dataset.proposalId;
    consumer.subscriptions.create({channel:"ProposalChatChannel", id: id}, {
      received(data) {
        allMessages.insertAdjacentHTML('beforeend', data);
        chatConsole.scrollTop = chatConsole.scrollHeight;
      },
    });
  }
}

export { initChatroomCable };
