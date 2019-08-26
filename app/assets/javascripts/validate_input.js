// use for change message of validation in required data.
function field_required(empty_input){
  empty_input.value == '' ? empty_input.setCustomValidity('Field required!') : empty_input.setCustomValidity('');
  return true;
}

// use for change message of validation in required data.
var email = document.getElementById("user_email"),
	  password = document.getElementById("user_password"),
	  password_confirmation = document.getElementById("user_password_confirmation");

if(email){
	email.addEventListener("invalid", () => {
		field_required(email);
	});

	email.addEventListener("input", () => {
		field_required(email);
	});
}

if(password){
	password.addEventListener("invalid", () => {
		field_required(password);
	});

	password.addEventListener("input", () => {
		field_required(password);
	});
};

if(password_confirmation){
	password_confirmation.addEventListener("invalid", () => {
		field_required(password_confirmation);
	});

	password_confirmation.addEventListener("input", () => {
		field_required(password_confirmation);
	});
};
