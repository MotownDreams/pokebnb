const form = document.querySelector("#new_booking")

form.addEventListener("change", () => {
  const startDate = document.querySelector("#booking_start_date").value
  const endDate = document.querySelector("#booking_end_date").value
  const pricePerNight = document.querySelector(".price-per-night")
  const n = Number.parseInt(pricePerNight.innerText)
  var date1 = Date.parse(startDate);
  var date2 = Date.parse(endDate);
  // debugger;
  var timeDiff = Math.abs(date2 - date1);
  var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

  const totalPrice = diffDays * n
  document.querySelector("#total-price").innerText = totalPrice
  console.log(totalPrice)
})

