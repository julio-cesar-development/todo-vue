import Vue from 'vue';
import App from './App.vue';
import { capitalize } from '@/utils/Capitalize.js';
// import { assertInt, assertFloat } from '@/utils/Assert.js';
// import { Price } from '@/utils/Price.js';

Vue.config.productionTip = false;
Vue.config.devtools = true;

Vue.filter('capitalize', capitalize);
// Vue.filter('assertInt', assertInt);
// Vue.filter('assertFloat', assertFloat);

// Vue.directive('Price', Price);

new Vue({
  render: h => h(App),
}).$mount('#app');
