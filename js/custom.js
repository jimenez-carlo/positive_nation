function get_content(url, target = 'content') {
  const content = document.getElementById(target);
  content.innerHTML = '<section id="page" class="container">Loading Content Please wait... <i class="fa fa-spinner fa-spin"></i></section>';  
  return fetch(url)
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.text(); // Parse the response as JSON
  })
  .then(data => {
    content.innerHTML = data;
    reloadRipple();
    loadDefault();
  })
  .catch(error => {
    console.error('Fetch error:', error);
  });
}



const body = document.querySelector('body');
const content = document.getElementById('content');
body.addEventListener('click', handleClick);
body.addEventListener("submit", handleSubmit);

function handleSubmit(e) {
  e.preventDefault();
  clearErrors();
  const formData = new FormData(e.target);
  formData.append("form", e.target.getAttribute('name'));
  form_name = e.target.getAttribute('name');
  return fetch("request.php", {
    method: "POST",
    body: formData
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json(); // Parse the response as JSON
  })
    .then(data => {
      let result = document.getElementById('result');
      result.innerHTML = data.result;
      if (data.items != '') {
        errorFields(data.items);
      }
      if (data.status == true && ['login_merchant','login_customer'].indexOf(form_name) >= 0) {
        window.location.reload();
      }
  })
  .catch(error => {
    console.error('Fetch error:', error);
  });
  
}
  
function handleClick(e) {
  if (e.target.tagName == 'A' && e.target.hasAttribute('data-href')) {
    let url = e.target.getAttribute('data-href');
    let id = e.target.getAttribute('data-params') || 0;
    get_content(`page.php?page=${url}&id=${id}`);
  }
}



function reloadRipple(scriptSrc = 'js/ripple.js') {
    const existingScript = document.querySelector(`script[src="${scriptSrc}"]`);
    if (existingScript) {
        existingScript.remove();
        const newScript = document.createElement('script');
        newScript.src = scriptSrc;
        document.head.appendChild(newScript);
    }
}





function loadDefault(){
  $('#carousel').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    itemWidth: 150,
    itemMargin: 5,
    asNavFor: '#slider'
  });

  $('#slider').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    sync: "#carousel"
  });
}


function clearErrors() {
  $(".has-error").removeClass("has-error");
}

function errorFields(strings) {
  $.each(strings.split(","), function (i,word) {
    var field = $("#" + word);
 
      if (!$(field).parent().hasClass("has-error")) {
        $(field).parent().addClass("has-error");
      }
  });
}

function requireFields(strings) {
  var errors = 0;
  $.each(strings.split(","), function (i,word) {
    var field = $("#" + word);
    console.log("#" + word);
    console.log(field);
    if (field.val() == "" || field.val() == null || field.val().length == 0) {
      if (!$(field).parent().hasClass("has-error")) {
        $(field).parent().addClass("has-error");
      }
      errors++;
    }
  });
  return (errors == 0) ? true : false;
}