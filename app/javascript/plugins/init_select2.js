import $, { removeData } from 'jquery';
import 'select2';


const initSelect2 = () => {
  $('#project_tags').select2({
    placeholder: 'Select an option',
    maximumSelectionLength: 3,
    theme: "classic"});
    document.getElementById('project_tag_tag');
};

export { initSelect2 };
