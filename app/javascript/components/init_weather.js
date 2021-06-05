const initWeather = () => {

  const description = document.querySelector('#description');
  if (description) {
  
  
    const temperature = document.querySelector('#temperature');
    const lon = temperature.dataset.longitude;
    const lat = temperature.dataset.latitude;
    const icon = document.querySelector('#icon');
  
    const url = `https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&appid=33723607922dc4022ad15bf945b658cb&&units=metric`
  
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        description.innerText = data.current.weather[0].description;
        temperature.innerText = `${(Math.round(data.current.temp))}°C`;
        icon.src = `http://openweathermap.org/img/wn/${data.current.weather[0].icon}.png`
      });
  }
}

export { initWeather };
