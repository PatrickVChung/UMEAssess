import { Controller } from "@hotwired/stimulus"
import DataTable from "datatables.net-bs5"

// 

export default class extends Controller {
  static targets = ["table"]

  connect() {
    this.dt = new DataTable(this.tableTarget, {
      // Your DataTables configuration options here
      paging: true,
      searching: true,
      responsive: true
    })
  }

  disconnect() {
    // Clean up to prevent memory leaks with Turbo
    if (this.dt) {
      this.dt.destroy()
    }
  }
}
