import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import "@/assets/styles/main.scss";

import { library } from "@fortawesome/fontawesome-svg-core";
import {
  faCheck,
  faTimes,
  faStar as fasStar
} from "@fortawesome/free-solid-svg-icons";
import {
  faStar as farStar,
  faEye,
  faEyeSlash
} from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

library.add(faCheck);
library.add(faTimes);
library.add(fasStar);
library.add(farStar);
library.add(faEye);
library.add(faEyeSlash);

Vue.component("fa-icon", FontAwesomeIcon);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
