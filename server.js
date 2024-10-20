const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const axios= require('axios');
const path = require('path');
const PORT = 5500;

const app = express();


const pool = new Pool({
  user: 'postgres',
  host: '127.0.0.1',
  database: 'contact_form',
  password: 'Paddy_12',
  port: 5432,
});

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

const RECAPTCHA_SECRET_KEY = '6LejKGUqAAAAAL0yy3_UUX9N1L_gUfdn3IetKwvg';

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

      await pool.query(
          'INSERT INTO contacts (name, email, message) VALUES ($1, $2, $3)',
          [name, email, message]
      );
      

      res.status(200).send('Form submitted successfully');

  } catch (err) {
      console.error('Error inserting data into PostgreSQL', err);
      res.status(500).send('Something went wrong');
  }
});


app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

const cors = require('cors');
app.use(cors());

