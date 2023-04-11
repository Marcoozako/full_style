// import flatpickr from "flatpickr"
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const startDateInput = document.getElementById('booking_begin_date');
const endDateInput = document.getElementById('booking_end_date');

const initFlatpickr = () => {

  if (startDateInput) {
    const unavailableDates = JSON.parse(document.querySelector('#flat-booking-dates').dataset.unavailable)
    endDateInput.disabled = true

    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d",
    });

    console.log('im in the file')

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        dateFormat: "Y-m-d"
        });
      })
    };
};

export { initFlatpickr };
