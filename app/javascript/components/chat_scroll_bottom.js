const chatScrollBottom = () => {
  const chatConsole = document.querySelector('.chat-console');
  chatConsole.scrollTop = chatConsole.scrollHeight;
};

export { chatScrollBottom };
