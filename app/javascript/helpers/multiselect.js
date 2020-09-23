function applySelect2() {
  $('select').select2()
  $('.multiselect').select2({
    width: '100%'
  })
}

window.addEventListener('turbolinks:load', () => {
  applySelect2()
});

// For nested forms.
$(document).on('cocoon:after-insert', (e, insertedItem, originalEvent) => {
  applySelect2()
});
