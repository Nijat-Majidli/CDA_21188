// Controler input Sujet
let sujet = document.getElementById("text_sujet");
let error = document.getElementById("error1");

sujet.addEventListener("blur", function()
{
    var filtreString = new RegExp("^[A-Za-z,?!]+$");
    var resultat = filtreString.test(sujet.value);

    if(resultat==false){
        sujet.value = "";
        sujet.style.border = "2px solid red";
        error.textContent = "Veuillez utiliser que des lettres!";
        error.style.color = "red";
    }
    else{
        error.textContent = "";
        sujet.style.border = "";
    }
});


// Controler input email
let email = document.getElementById("user_mail");
let error2 = document.getElementById("error2");

email.addEventListener("blur", function()
{

    var filtreEmail = new RegExp(/^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/);
    var resultat2 = filtreEmail.test(email.value);

    if(resultat2==false){
        email.value = "";
        email.style.border = "2px solid red";
        error2.textContent = "Veuillez saisir bon adresse mail!";
        error2.style.color = "red";
    }
    else {
        error2.textContent = "";
        email.style.border = "";
    }
});

