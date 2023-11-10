chrome.webRequest.onBeforeRequest.addListener(
  function(details) {
    // Check if the requested URL matches a blocked site
    if (isBlocked(details.url)) {
      // Cancel the request to block the website
      return { cancel: true };
    }
  },
  { urls: ["youtube.com", "facebook.com", "instagram.com"] },
  ["blocking"]
);

// Function to check if a URL is blocked
function isBlocked(url) {
  // Retrieve blocked sites from storage (you can use options page to manage this)
  var blockedSites = ["example.com", "blockedsite.com"];
  // Check if the URL matches any blocked site
  return blockedSites.some(function(site) {
    return url.includes(site);
  });
}
