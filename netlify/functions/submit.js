// netlify/functions/submit.js
exports.handler = async (event) => {
    try {
      const formData = JSON.parse(event.body);
  
      // Process the form data here, e.g., save to a database, send an email, etc.
  
      return {
        statusCode: 200,
        body: JSON.stringify({ message: "Form submitted successfully!" }),
      };
    } catch (error) {
      return {
        statusCode: 500,
        body: JSON.stringify({ error: "There was an error processing the form submission." }),
      };
    }
  };
  