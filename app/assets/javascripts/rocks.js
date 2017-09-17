const $ = require('jquery')
const API =  "http://localhost:3000"

function Rock (rock) {
  this.id = rock.id
  this.location_found = rock.location_found
  this.description = rock.description
  this.public_url = rock.public_url
}

Rock.getAllRocks = function () {
  return $.getJSON(`${API}/api/v1/rocks`)
}
