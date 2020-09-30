/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

require('@rails/ujs').start()
require('turbolinks').start()
require('jquery')
require('@nathanvda/cocoon')

import 'select2'

// Load all JS on every page here, via this single entry point.
// It's possible to do this better, either conditionally, or with separate packs,
// but there are lots of gotchas for potentially minimal performance gain.
// Currently on step 1 of this: https://stackoverflow.com/a/59495659/4741698
import '../helpers/multiselect.js'
import '../helpers/nhsuk.js'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
