// Use to initialize selects
var select_box = document.querySelectorAll('select');
if(select_box){ $(() => { $('select').formSelect() }) };

// Use to initialize timepicker
var time_box = document.querySelectorAll('timepicker');
if(time_box){ $(() => { $('.timepicker').timepicker() }) };

// Use to initialize datepicker
var date_box = document.querySelectorAll('datepicker');
if(date_box){ $(() => { $('.datepicker').datepicker() }) };

// Use to dashboard view
document.addEventListener('DOMContentLoaded', () => {
  let side_nav_page = document.querySelectorAll('.sidenav'),
      side_instance = M.Sidenav.init(side_nav_page);

  // use to close alert and notice
  let alert_close = document.getElementById('alert_close');
  if(alert_close){alert_close.addEventListener("click", fadeOutEffect);};
});

// Use to login view
document.addEventListener('DOMContentLoaded', () => {
  let notices = document.querySelectorAll('.message-login');
  let notice_instance = M.Collapsible.init(notices);
});

document.addEventListener('DOMContentLoaded', () => {
  M.updateTextFields();
});

function fadeOutEffect(){
  let fadeTarget = document.getElementById("alert_box");
  let fadeEffect = setInterval(function (){
    if(!fadeTarget.style.opacity)
      fadeTarget.style.opacity = 1;

    if(fadeTarget.style.opacity > 0){
      fadeTarget.style.opacity -= 0.1;
    }
    else{
      clearInterval(fadeEffect);
      fadeTarget.style.transition = '3s';
      fadeTarget.style.display = 'none';
    }
  }, 100);
};

// Reload navbar by Materialize bug
$(() => {
  let side_nav_page = document.querySelectorAll('.sidenav'),
      side_instance = M.Sidenav.init(side_nav_page);
});