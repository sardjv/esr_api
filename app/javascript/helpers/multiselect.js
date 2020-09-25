// For nested forms.
$(document).on('cocoon:after-insert', (e, insertedItem, originalEvent) => {
  $('.multiselect').select2({
    width: '100%'
  })

  // Update permission#columns when permission#resource changed.
  $('.resource-select').on('change', (e) => {
    // Temporary ID used to distinguish between multiple nested forms.
    const id = e.target.id.split('_')[3]
    const target = $('#token_permissions_attributes_' + id + '_columns')
    const url = '/ui/tokens/new.json?resource=' + e.target.value
    updateSelect(target, url)
  });
});

// Used if there is an error on a form with a multiselect.
window.addEventListener('turbolinks:load', () => {
  $('.multiselect').select2({
    width: '100%'
  })

  // Update permission#columns when permission#resource changed.
  $('.resource-select').on('change', (e) => {
    // Temporary ID used to distinguish between multiple nested forms.
    const id = e.target.id.split('_')[3]
    const target = $('#token_permissions_attributes_' + id + '_columns')
    const url = '/ui/tokens/new.json?resource=' + e.target.value
    updateSelect(target, url)
  });
});

function updateSelect(target, url) {
  // Fetch data.
  $.ajax({
    url: url,
  }).done(function(response) {
    // Find columns selector with the same ID, and update the column options.
    target.empty().select2({
      width: '100%',
      data: response.column_options
    })
  });
}
