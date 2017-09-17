const $ = require('jquery')
const API =  "http://localhost:3000"

function Rock (rock) {
  this.id = rock.id
  this.location_found = rock.location_found
  this.description = rock.description
  this.public_url = rock.public_url
}

Rock.prototype.toHML= function () {
  return `<div class="media">
            <div class="media-left">
              <%= link_to image_tag(rock.image.url, class: 'media-object'), rock.image.url, target: '_blank' %>
            </div>
            <div class="media-body">
              <h4 class="media-heading"><%= rock.location_found %></h4>
              <h4 class="media-heading"><%= rock.description %></h4>
              <%= link_to("What Is This Rock?", rock_path(rock.id), class: "btn") %>
            </div>
          </div>`
}

Rock.getAllRocks = function () {
  return $.getJSON(`${API}/api/v1/rocks`)
}
