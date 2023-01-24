module.exports = async function (context, myTimer) {
    // The admin API client is the easiest way to use the API
   const GhostAdminAPI = require('@tryghost/admin-api');

   // Configure the client
   const api = new GhostAdminAPI({
       url: 'https://wapp-pri-ghost.azurewebsites.net',
       // Admin API key goes here
       key: process.env["apiKey"],
       version: 'v3'
   });

   // Get all posts
   const allPosts = await api.posts.browse({limit: 'all'});

   // Delete all posts
    allPosts.map((post) => {   
           api.posts.delete({id: post.id});
   });

   // Create post
   // api.posts.add({title: 'Hello world342'})
   //     .then(response => console.log(response))
   //     .catch(error => console.error(error));
};