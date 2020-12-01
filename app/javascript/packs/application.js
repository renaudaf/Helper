// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import { initSelect2 } from '../plugins/init_select2.js';
import { addMeasureOnClick } from '../components/add_measure';
import { initChatroomCable } from '../channels/proposal_chat_channel';

import { algoliaSearch } from '../components/search_bar';

import { messageClear } from '../components/message_clear';
import { initAutocomplete } from '../plugins/init_autocomplete.js';

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
const chatConsole = document.querySelector('.chat-console');
if (chatConsole) {
  chatConsole.scrollTo(0, chatConsole.scrollHeight);
}

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // searchResult();
  initSelect2();
  algoliaSearch();
  addMeasureOnClick();
  initChatroomCable();
  messageClear();
  initAutocomplete();
});
