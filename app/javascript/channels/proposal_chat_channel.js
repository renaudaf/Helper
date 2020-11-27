import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.querySelector('.message-container');
  if (messagesContainer) {
    const id = messagesContainer.dataset.proposalId;

    consumer.subscriptions.create({channel:"ProposalChatChannel", id: id}, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initChatroomCable };
