document.addEventListener("turbo:before-fetch-request", (event) => {
  const targetFrame = event.detail.fetchOptions.target

  if (targetFrame === "meetings_results") {
    document
      .getElementById("meetings-spinner")
      ?.classList.remove("d-none")
  }
})

document.addEventListener("turbo:frame-load", (event) => {
  if (event.target.id === "meetings_results") {
    document
      .getElementById("meetings-spinner")
      ?.classList.add("d-none")
  }
})
