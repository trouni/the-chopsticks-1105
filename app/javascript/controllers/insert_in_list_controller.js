import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ['list'] // The target is now accessible using this.listTarget

  connect() {
    // console.log('Connected to insert in list controller')
    console.log(this.listTarget)
  }

  submit(event) {
    // We prevent the default submit behavior which would reload the entire page
    event.preventDefault()
    const form = event.target
    // // We create the review on the server
    const url = form.action
    fetch(url, {
      method: form.method,
      headers: { "Accept": "application/json" },
      body: new FormData(form)
    })
    .then(response => response.json())
    .then(data => {
      // We insert the new created review on the page
      if (data.review_html) {
        this.listTarget.insertAdjacentHTML('afterBegin', data.review_html)
      }
      form.outerHTML = data.form_html
    })
  }

}
