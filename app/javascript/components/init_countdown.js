// Set the date we're counting down to
// Update the count down every 1 second
const initCountdown = () => {
  const demoElement = document.getElementById("booking-show-countdown");
  
  // If the count down is finished, write some text
  if (demoElement) {
    const refDate = demoElement.dataset.referenceDate;
    const countDownDate = new Date(refDate).getTime();
    // Get today's date and time
    const now = new Date().getTime();

    // Find the distance between now and the count down date
    const distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));

    const html = `<li><span class="days">${days}</span><p class="days_text mt-2">Days</p></li>
              <li class="seperator">:</li>
              <li><span class="hours">${("00" + hours.toString()).slice(-2)}</span><p class="hours_text mt-2  ">Hours</p></li>
              <li class="seperator">:</li>
              <li><span class="minutes">${minutes}</span><p class="minutes_text mt-2">Minutes</p></li>`;

    // Display the result in the element with id="demo"
    demoElement.innerHTML = html;
  }
};

export { initCountdown };
