const initAutocomplete = (selector) => {
  const places = require('places.js');
  const element = document.getElementById(selector)
  if (element) {
    const searchAutocomplete = places({
      appId: 'pl9D490WAV0U',
      apiKey: '2059e9302af6d4cbeff9b9cd7fe86f62',
      container: element
    });
    console.log(`initialized ${selector}`)
  }
}

export { initAutocomplete }

