require('nhsuk-frontend/packages/nhsuk')
require.context('nhsuk-frontend/packages/assets', true)
import '../stylesheets/nhsuk.scss'
import MenuToggle from 'nhsuk-frontend/packages/components/header/menuToggle';

// Solve issue where Turbolinks stops menus working after page navigation.
document.addEventListener('turbolinks:render', function() {
  MenuToggle()
})
