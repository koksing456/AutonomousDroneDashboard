//Firebase
// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-analytics.js";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyCC-D6wt3d2F06w3BuGM2WGd0EDVZMS_vE",
    authDomain: "drone-project-f9a08.firebaseapp.com",
    databaseURL: "https://drone-project-f9a08-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "drone-project-f9a08",
    storageBucket: "drone-project-f9a08.appspot.com",
    messagingSenderId: "563164922782",
    appId: "1:563164922782:web:bb2424cb956aa6dfa60c8f",
    measurementId: "G-9T34FLVDMH"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

import { getDatabase, ref, set, child, update, remove } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-database.js";
import { getAuth, createUserWithEmailAndPassword, signOut, signInWithEmailAndPassword, onAuthStateChanged, updatePassword   } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-auth.js";

const db = getDatabase();
const auth = getAuth();

//auth status change
onAuthStateChanged(auth, (user) => {
    if (user) {
        console.log('user log in', user);
        document.getElementById('email').value = user.email;
    } else {
        console.log('user log out', user)
    }
})

//update password

const setButton = document.getElementById('setBtn');
//const profileForm = document.querySelector('#profile-form');
setButton.addEventListener('click', (e) => {
    e.preventDefault();

    const user = auth.currentUser;
    const newPassword = document.getElementById('password').value;
    const retypeNewPassword = document.getElementById('retypePassword').value;

    const firebaseErrors = {
        'auth/invalid-email': "Invalid email format",
        'auth/email-already-in-use': 'Email already in use',
        'auth/weak-password': "Password should be at least 6 characters",
        'auth/user-not-found': "User not found",
        'auth/wrong-password': "Wrong password"
    };

    if (newPassword == retypeNewPassword) {
        updatePassword(user, newPassword).then(() => {
            //profileForm.reset();
            console.log('Update successful.')
            alert('Update successful.')
            document.getElementById('error').innerHTML = '';

        }).catch(err => {
            document.getElementById('error').innerHTML = firebaseErrors[err.code] || err.message;
        });
    } else {
        document.getElementById('error').innerHTML = 'Password does not match with retype password';
    }
    
});




