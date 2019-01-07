import Vue from "vue";
import VueRouter from "vue-router";

import "axios";
import plantSearch from "./plant-search";
import orderConfirmation from "./order-confirmation";

Vue.use(VueRouter);

Vue.component("plantSearch", plantSearch);
Vue.component("orderConfirmation", orderConfirmation);

var router = new VueRouter({
  routes: [
      { path: '/', component: plantSearch },
      { path: '/plants/:plant_id', component: orderConfirmation, name: "select-plant" },
      { path: '*', redirect: '/' }
  ]
});

new Vue({router}).$mount("#app");