import consumer from "./consumer";

const addClassToMsgs = () => {
  const currentUser = Number.parseInt(document.cookie.split('=')[1], 10);
  const msgs = document.querySelectorAll('.message');
  msgs.forEach((msg) => {
    const senderId = Number.parseInt(msg.dataset.senderid, 10);
   if (currentUser === senderId) {
    msg.classList.add('msg-sent');
   } else {
    msg.classList.add('msg-received');
   }
  });
};


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
        addClassToMsgs();
      },
    });
  }
}

export { initChatroomCable };




