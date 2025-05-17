'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "13bff7e0f1cc97af4c3d98481ac71c10",
"assets/AssetManifest.bin.json": "cb447407970872c63b916578b71e4bb0",
"assets/AssetManifest.json": "f6c74270ef72aab2347d35370a0479da",
"assets/assets/Gifts/diamond.png": "3a14794a28fd597a32a830e898f53c4a",
"assets/assets/Gifts/gem.png": "c3bdf4faffa17c69ce0d5e504f7eaebc",
"assets/assets/Gifts/heart.png": "859d4ad3c8b505ccad51a36fa1c4511c",
"assets/assets/Gifts/pooja.png": "8179557fe5eca3c15a783aa4ee2f32a7",
"assets/assets/Gifts/rose.png": "0bf9cb403bceca876648f9ac9f3fcea9",
"assets/assets/icons/customer_support.png": "53722d92d7c889a0b211ab8851a4d7b5",
"assets/assets/icons/filter.png": "7e1dce9444236e4a1bbdd101d651f47c",
"assets/assets/icons/notification.png": "ae8005808c1532e8f7cf60a645505516",
"assets/assets/icons/search.png": "00406069a28faa3806ded4050f79f880",
"assets/assets/images/app_logo.png": "85a2ac4de7ca9c76323e630b1f0456f7",
"assets/assets/images/astrologer1.png": "59597a8e5a3124fcef7ba41ec8b409ae",
"assets/assets/images/astrologer10.png": "3cfaddd5c33ff24cde5613b70e8dd544",
"assets/assets/images/astrologer11.png": "c39cedd1c2e94afe8fb30086d3a1355e",
"assets/assets/images/astrologer12.png": "4533cdb24492204974f71489db226e7b",
"assets/assets/images/astrologer2.png": "f744f927da789bd721f13fa9e64c4d17",
"assets/assets/images/astrologer3.png": "1cf18b1edfffa73b6b6158aef3f928f3",
"assets/assets/images/astrologer4.png": "1871ffb36efe6884fee0ec7db269098d",
"assets/assets/images/astrologer5.png": "cfe044c2516b771c5cb86ba5c718ff3b",
"assets/assets/images/astrologer6.png": "9709bf448df6abe3e7de55394db67d5e",
"assets/assets/images/astrologer7.png": "e4214c5310e453d68a183b46376a473c",
"assets/assets/images/astrologer8.png": "79d5565d9aa73328bce0b314d915d938",
"assets/assets/images/astrologer9.png": "108bd5a43719a4d607dbde71541cfb17",
"assets/assets/images/banner.png": "026fb85285c2f7ed05cd591d28f6c983",
"assets/assets/images/horoscope.png": "560c6865e64d251b0f400808c0d498f5",
"assets/assets/images/kundali.png": "7c87176bba5d46dcd30ca6aadef0382f",
"assets/assets/images/leading_appbar.png": "51238e132b74299146f55532ad4e9c7b",
"assets/assets/images/matchmaking.png": "7b3f7f1ab2bced84d09c2eb8dc1c8be7",
"assets/assets/images/subh_mahurat.png": "b6c2ad52bfbcad431bcbadd0d2d6652b",
"assets/assets/images/trailing_appbar.png": "ae446fe129a67d77d05198a085982dfe",
"assets/assets/image_astrologer/astro1.png": "98efca4eecd40634f337c7a37bcab9be",
"assets/assets/image_astrologer/astro2.png": "98efca4eecd40634f337c7a37bcab9be",
"assets/assets/image_astrologer/astro3.png": "57f4e9260af5bf4fa859404b95163ae9",
"assets/assets/image_astrologer/astro4.png": "d402b6d1c7036720c95844bcf93f5b93",
"assets/assets/lottie/senf.json": "a6e8bcd9d89b26e9919a49ab944d22ce",
"assets/assets/navbar_icons/courses.png": "d8241a26dec71f757f4f157d7bec9e15",
"assets/assets/navbar_icons/home.png": "fd41aa4d336298766ca97deb645f67d1",
"assets/assets/navbar_icons/profile.png": "efdc2710ca874b948c7f0675ae655e7a",
"assets/assets/navbar_icons/shop.png": "8d23d19cb82d4e3a972f73501a0318e6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2713096673f9ea4518181e8f999637d7",
"assets/NOTICES": "00ddb42b5affeb92346299cf503a6820",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "9db0f8131d5a917b9c87c59e10328ef8",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "26a2e880befe7b6f48bbfd1e4e5495d4",
"icons/Icon-192.png": "1e470520ea708ddcd0863a1746f833b1",
"icons/Icon-512.png": "29a25c8d0955e11d72503b154f1d12f7",
"icons/Icon-maskable-192.png": "1e470520ea708ddcd0863a1746f833b1",
"icons/Icon-maskable-512.png": "29a25c8d0955e11d72503b154f1d12f7",
"index.html": "10c15102b41479d2429e1c35601fe878",
"/": "10c15102b41479d2429e1c35601fe878",
"main.dart.js": "b100481e498cd60b775ecee2aebe5f0c",
"manifest.json": "bdae993e9ec7d4d4b0314ca53f8af8e8",
"version.json": "124f21fe4fc6a46a78eb310bb2d196c6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
