const $ = require('jquery')

const Rock = require('./rocks')

$(document).ready(function () {
  Rock.allRocksToHTML ()
  .then(function (rocksHTML) {
    $('.rock_container').append (rocksHTML)
  })
})
