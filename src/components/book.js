/**
@license
*/

import { LitElement, html } from '@polymer/lit-element'

class Book extends LitElement {
  constructor() {
    super();
  }

  static get properties() {
    return (first: String, last: String, type: String);
  }

  _render({first, last, type}) {
    return html`
      <contact-view manager='${type == 'manage'}'>
        <div>${first} ${last}</div>
      </contact-view>
    `
  }
}

customElements.define('book', Book);


