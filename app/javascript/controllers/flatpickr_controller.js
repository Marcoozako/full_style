import { Controller } from '@hotwired/stimulus';
import flatpickr from 'flatpickr';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';
export default class extends Controller {
  static targets = ['startTime', 'endTime'];
  connect() {
    const config = {
      altInput: true,
      mode: 'range',
      dateFormat: 'F j, Y',
      plugins: [new rangePlugin({ input: this.endTimeTarget })],
      onClose: (_, __, fp) => {
        if (fp.selectedDates.length === 2) {
          const startDate = fp.formatDate(fp.selectedDates[0], 'Y-m-d');
          const endDate = fp.formatDate(fp.selectedDates[1], 'Y-m-d');
          document.getElementById('range_start').value = startDate;
          document.getElementById('range_end').value = fp.formatDate(
            fp.selectedDates[1],
            'F j, Y'
          );
        }
      },
    };
    flatpickr(this.startTimeTarget, config);
  }
}
