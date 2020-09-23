function applySelect2() {
  $('select').select2()
}

window.addEventListener('turbolinks:load', () => {
  applySelect2()
});

// For nested forms.
$(document).on('cocoon:after-insert', (e, insertedItem, originalEvent) => {
  applySelect2()

  $('.multiselect').select2({
    width: '100%'
  })

  // Update permission#columns when permission#resource changed.
  $('.resource-select').on('change', (e) => {
    // Temporary ID used to distinguish between  multiple nested forms.
    const id = e.target.id.split('_')[3]
    const url = '/ui/tokens/new.json?resource=' + e.target.value

    // Fetch data.
    $.ajax({
      url: url,
    }).done(function(response) {
      // Find columns selector with the same ID, and update the column options.
      $('#token_permissions_attributes_' + id + '_columns').empty().select2({
        width: '100%',
        data: response.column_options
      })
    });

  });
});
