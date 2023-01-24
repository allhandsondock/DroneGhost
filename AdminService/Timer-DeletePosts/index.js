module.exports = async function (context, myTimer) {
    // The admin API client is the easiest way to use the API
   const GhostAdminAPI = require('@tryghost/admin-api');

   // Configure the client
   const api = new GhostAdminAPI({
       url: 'https://wapp-pri-ghost.azurewebsites.net',
       // Admin API key goes here
       key: 'key',
       version: 'v3'
   });

   // Make an authenticated request
   api.posts.add({title: 'Hello world22'})
       .then(response => console.log(response))
       .catch(error => console.error(error));
};