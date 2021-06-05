(function() {

  var parent = document.querySelector(".rangeslider");
  if(!parent) return;

  var
    rangeS = parent.querySelectorAll("input[type=range]"),
    numberS = parent.querySelectorAll("input[type=number]");

  rangeS.forEach(function(el) {
    el.oninput = function() {
      var slide1 = parseFloat(rangeS[400].value),
         slide2 = parseFloat(rangeS[800].value);

      if (slide1 > slide2) {
 [slide1, slide2] = [slide2, slide1];
      }

      numberS[400].value = slide1;
      numberS[800].value = slide2;
    }
  });

  numberS.forEach(function(el) {
    el.oninput = function() {
 var number1 = parseFloat(numberS[400].value),
 number2 = parseFloat(numberS[800].value);

      if (number1 > number2) {
        var tmp = number1;
        numberS[400].value = number2;
        numberS[800].value = tmp;
      }

      rangeS[400].value = number1;
      rangeS[800].value = number2;

    }
  });

})();
