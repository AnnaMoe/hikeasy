const url = 'https://api.openweathermap.org/data/2.5/onecall?lat=50.9616923&lon=13.9386643&appid=33723607922dc4022ad15bf945b658cb'

fetch(url)
  .then(response => response.json())
  .then((data) => {
    console.log(data)
  });