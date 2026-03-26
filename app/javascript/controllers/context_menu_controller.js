import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  // CRITICAL: This must be uncommented for this.epaValue to work!
  static values = { epa: String,
                    courseName: String,
                    currentUser: String
                  }


  connect() {
    this.epaDataStore = {}

    if (!this.hasMenuTarget) {
      console.warn("Context Menu: menu target missing")
      return
    }

    this.buildMenu()
    this.menuTarget.style.display = "none"

    console.log("Inside contex_menu_controller.js file ==> connect!!")

    this.clickOutsideHandler = (e) => this.closeMenu(e)
    document.addEventListener("click", this.clickOutsideHandler)
  }

  get menuItems() {
    return [
      { label: "EPA1A - History", key: "EPA1A" },
      { label: "EPA1B - Physical", key: "EPA1B" },
      { divider: true },
      { label: "EPA2 - DDx", key: "EPA2" },
      { label: "EPA3 - Tests", key: "EPA3" },
      { label: "EPA4 - Orders", key: "EPA4" },
      { label: "EPA5 - Document", key: "EPA5" },
      { label: "EPA6 - Present", key: "EPA6" },
      { label: "EPA7 - EBDM", key: "EPA7" },
      { label: "EPA8 - Handover", key: "EPA8" },
      { label: "EPA9 - Collaboration", key: "EPA9" },
      { label: "EPA10 - Urgent", key: "EPA10" },
      { label: "EPA11 - SDM", key: "EPA11" }
    ]
  }

  buildMenu() {
    if (!this.hasMenuTarget) return;

    this.menuTarget.innerHTML = this.menuItems.map(item => {
      if (item.divider) return '<div class="dropdown-divider"></div>'
      return `
        <button type="button"
                class="dropdown-item"
                data-key="${item.key}"
                data-action="mousedown->context-menu#copyAndPaste">
          <i class='bi bi-copy' style='color:#E1191C'></i> ${item.label}
        </button>`
    }).join("")
  }

  show(event) {
    event.preventDefault()
    event.stopPropagation()

    if (!this.hasMenuTarget) return

    // Teleport safely at runtime
    if (!document.body.contains(this.menuTarget)) {
      document.body.appendChild(this.menuTarget)
    }

    this.savedSelection = window.getSelection().toString().trim()
    // 2. Capture the data from the <td> (the currentTarget of the right-click)
    const td = event.currentTarget
    const fullCourseName = td.dataset.contextMenuCourseNameValue
    const match = fullCourseName.match(/\[(.*?)\]/)

    // Use the standard dataset naming (camelCase)
    //this.activeCourseName = td.dataset.contextMenuCourseNameValue
    this.activeCourseName = match ? match[1] : fullCourseName
    this.activeKey = td.dataset.key

    console.log("Captured in show:", this.activeCourseName) // Should show the name now!


    const { clientX: x, clientY: y } = event;
    const menu = this.menuTarget;

      // 2. Prepare for measurement
      menu.style.visibility = 'hidden';
      menu.style.display = 'block';

      // 3. Get dimensions
      const menuHeight = menu.offsetHeight;
      const menuWidth = menu.offsetWidth;
      const windowHeight = window.innerHeight;
      const windowWidth = window.innerWidth;

      // 4. Vertical Collision (Bottom Edge)
      let finalY = y;
      if (y + menuHeight > windowHeight) {
        // Flip it: instead of starting at Y, we end at Y
        finalY = y - menuHeight;
      }

      // 5. Horizontal Collision (Right Edge)
      let finalX = x;
      if (x + menuWidth > windowWidth) {
        finalX = x - menuWidth;
      }

      // 6. Apply Final Position
      menu.style.position = 'fixed';
      menu.style.top = `${finalY}px`;
      menu.style.left = `${finalX}px`;
      menu.style.visibility = 'visible';
      menu.style.zIndex = '1050';
  }

  copyAndPaste(event) {
    const textToPaste = this.savedSelection
    const courseName = this.activeCourseName // Use the instance variable!
    const currentUser = this.currentUserValue
    const key = this.activeKey || event.currentTarget.dataset.key

    const today = new Date().toISOString().split('T')[0]

    if (!textToPaste) return alert("Please highlight some text first!")

    this.epaDataStore[key] = textToPaste
    // this.syncMetadata()

    // Safety check for epaValue
    const currentEpa = this.hasEpaValue ? this.epaValue : null

    console.log("Current User:", currentUser)
    console.log("Selected Course:", courseName)

    if (currentEpa === key) {
      let commentsField;

      const reviewer1 = document.getElementById("epa_review_reviewer1");
      // 2. Assign the element based on your logic
      if (reviewer1 && reviewer1.value === currentUser) {
        commentsField = document.getElementById("epa_review_general_comments1");
      } else {
        commentsField = document.getElementById("epa_review_general_comments2");
      }
      if (commentsField) {
        const formattedEntry = `${today}:${courseName}: ${textToPaste}`
        commentsField.value = commentsField.value
          ? `${commentsField.value}\n${formattedEntry}`
          : formattedEntry

        commentsField.dispatchEvent(new Event('input'))
        commentsField.focus()
      }
    } else {
        this.epaDataStore[key] = `${today}:${courseName}: ${textToPaste}`
        let metadataField;
        metadataField = document.getElementById("metadata_storage");
        metadataField.value = JSON.stringify(this.epaDataStore);

    }
    this.closeMenu()
  }

  syncMetadata() {
    if (this.hasMetadataTarget) {
      this.metadataTarget.value = JSON.stringify(this.epaDataStore)
    }
  }

  closeMenu(event) {
    if (!this.hasMenuTarget) return;
    if (!event || !this.menuTarget.contains(event.target)) {
      this.menuTarget.style.display = 'none'
    }
  }

  disconnect() {
    if (this.menuTarget) {
      this.menuTarget.remove()
    }
    document.removeEventListener("click", this.clickOutsideHandler)
  }

}
