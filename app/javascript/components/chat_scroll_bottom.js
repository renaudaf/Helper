const chatScrollBottom = () => {
  const chatConsole = document.querySelector('.chat-console');
  if (chatConsole) { chatConsole.scrollTop = chatConsole.scrollHeight; }
};

export { chatScrollBottom };
