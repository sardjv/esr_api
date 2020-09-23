$('.js-states').select2()

// For nested forms.
$(document).on('cocoon:after-insert', (e, insertedItem, originalEvent) => {
  $('.js-states').select2({
    width: '100%'
  })
});
