import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initTotalPrice } from 'packs/total_price';
// import 'packs/total_price.js';

initMapbox();
initAutocomplete('search-location-home');
initAutocomplete('search-location-nav');
initAutocomplete('flat_location');
initTotalPrice();

