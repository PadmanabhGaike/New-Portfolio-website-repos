const express = require('express');
const bodyParser = require('body-parser');
const { createClient } = require('@supabase/supabase-js');
const axios= require('axios');
const path = require('path');
const PORT = 5500;
require('dotenv').config();

const app = express();


const cors = require('cors');
app.use(cors()); 
 


const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey)


app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

const RECAPTCHA_SECRET_KEY = process.env.RECAPTCHA_SECRET_KEY;

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
}); 


app.get('/index.html', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});


app.post('/submit', async (req, res) => {
  console.log('Received POST request:', req.body);
  const { name, email, message, 'g-recaptcha-response': recaptchaResponse } = req.body;

  const verificationUrl = `https://www.google.com/recaptcha/api/siteverify?secret=${RECAPTCHA_SECRET_KEY}&response=${recaptchaResponse}`;


  try {
    const captchaVerification = await axios.post(verificationUrl);
    const { success } = captchaVerification.data;

    if (!success) {
      return res.status(400).send('reCAPTCHA verification failed.');
    }

    const { data, error } = await supabase
    .from('contacts')
    .insert([
      { name, email, message }
    ]);

  if (error) throw error;
      

      res.status(200).send('Form submitted successfully');

  } catch (err) {
      console.error('Error inserting data: ', err);
      res.status(500).send('Something went wrong');
  }
});


app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});


