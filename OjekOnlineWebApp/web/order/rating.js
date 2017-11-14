var exp1 = false
var exp2 = false
var exp3 = false
var exp4 = false
var exp5 = false

var ratingValue = 0

function clickRating(rating) {
  document.getElementById('input-rating').value = rating;
  ratingValue = rating;

  var star = document.getElementById('rating-1');
  if (rating >= 1) {
    exp1 = true;
    star.src = "assets/star-gold.png";
  } else {
    exp1 = false;
    star.src = "assets/star-gray.png";
  }

  star = document.getElementById('rating-2');
  if (rating >= 2) {
    exp2 = true;
    star.src = "assets/star-gold.png";
  } else {
    exp2 = false;
    star.src = "assets/star-gray.png";
  }

  star = document.getElementById('rating-3');
  if (rating >= 3) {
    exp3 = true;
    star.src = "assets/star-gold.png";
  } else {
    exp3 = false;
    star.src = "assets/star-gray.png";
  }

  star = document.getElementById('rating-4');
  if (rating >= 4) {
    exp4 = true;
    star.src = "assets/star-gold.png";
  } else {
    exp4 = false;
    star.src = "assets/star-gray.png";
  }

  star = document.getElementById('rating-5');
  if (rating >= 5) {
    exp5 = true;
    star.src = "assets/star-gold.png";
  } else {
    exp5 = false;
    star.src = "assets/star-gray.png";
  }
}

function light(howmany) {
  var star1 = document.getElementById('rating-1')
  var star2 = document.getElementById('rating-2')
  var star3 = document.getElementById('rating-3')
  var star4 = document.getElementById('rating-4')
  var star5 = document.getElementById('rating-5')
  switch(howmany) {
    case 5 :
      star5.src = "assets/star-gold.png"
    case 4 :
      star4.src = "assets/star-gold.png"
    case 3 :
      star3.src = "assets/star-gold.png"
    case 2 :
      star2.src = "assets/star-gold.png"
    case 1 :
      star1.src = "assets/star-gold.png"
  }
}

function turnoff(whichone) {
  var star1 = document.getElementById('rating-1')
  var star2 = document.getElementById('rating-2')
  var star3 = document.getElementById('rating-3')
  var star4 = document.getElementById('rating-4')
  var star5 = document.getElementById('rating-5')
  switch(whichone) {
    case 5 :
      if (!exp5) star5.src = "assets/star-gray.png"
    case 4 :
      if (!exp4) star4.src = "assets/star-gray.png"
    case 3 :
      if (!exp3) star3.src = "assets/star-gray.png"
    case 2 :
      if (!exp2) star2.src = "assets/star-gray.png"
    case 1 :
      if (!exp1) star1.src = "assets/star-gray.png"
  }
}

function checkRating() {
  if (ratingValue == 0) {
    alert('Please kindly rate the driver')
  } else {
    document.getElementById('finish-order-form').submit()
  }
}