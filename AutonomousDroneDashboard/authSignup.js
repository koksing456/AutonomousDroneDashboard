//Firebase
        // Import the functions you need from the SDKs you need
        import {initializeApp} from "https://www.gstatic.com/firebasejs/9.2.0/firebase-app.js";
        import {getAnalytics} from "https://www.gstatic.com/firebasejs/9.2.0/firebase-analytics.js";
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

        import {getDatabase, ref, set, child, update, remove} from "https://www.gstatic.com/firebasejs/9.2.0/firebase-database.js";
        import { getAuth, createUserWithEmailAndPassword, signOut, signInWithEmailAndPassword, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-auth.js";

const db = getDatabase();
const auth = getAuth();

//auth status change
onAuthStateChanged(auth, (user) => {
    if (user) {
        console.log('user log in', user)
    } else {
        console.log('user log out', user)
    }
})

//signup
const signupForm = document.querySelector('#signup-form');

signupForm.addEventListener('submit', (e) => {
    e.preventDefault();

    const email = signupForm['email'].value;
    const password = signupForm['password'].value;
    const confirmPassword = signupForm['confirmPassword'].value;
    const firebaseErrors = {
        'auth/invalid-email': "Invalid email format",
        'auth/email-already-in-use': 'Email already in use',
        'auth/weak-password': "Password should be at least 6 characters"
    };
    console.log(email, password);

    if (password == confirmPassword) {
        createUserWithEmailAndPassword(auth, email, password).then(cred => {
            //console.log(cred.user);

            signupForm.reset();
            alert('Successfully sign up!')
            location.href = "Login2.aspx";
            signupForm.querySelector('.error').innerHTML = '';
        }).catch(err => {
            signupForm.querySelector('.error').innerHTML = firebaseErrors[err.code] || err.message;
        });
    } else {
        signupForm.querySelector('.error').innerHTML = 'Password does not match with confirm password';
    }
    
});



