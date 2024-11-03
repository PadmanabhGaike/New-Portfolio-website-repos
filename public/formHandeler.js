document.getElementById('contact-form').addEventListener('submit', async function(event) {
    event.preventDefault(); 
  
    
    const recaptchaResponse = grecaptcha.getResponse();
    if (!recaptchaResponse) {
      alert("Please complete the reCAPTCHA.");
      return;
    }
  
    const formData = {
      name: document.getElementById('name').value,
      email: document.getElementById('email').value,
      message: document.getElementById('message').value,
      'g-recaptcha-response': recaptchaResponse 
    };
  
    try {
      const response = await fetch('https://your-netlify-site.netlify.app/.netlify/functions/submit', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData)
      });
  
      if (response.ok) {
        document.getElementById('contact-form').style.display = 'none';
        document.getElementById('thankYouMessage').style.display = 'block';
      } else {
        alert('There was an issue submitting your message. Please try again later.');
      }
    } catch (error) {
      console.error('Error submitting form:', error);
    }
  });
  